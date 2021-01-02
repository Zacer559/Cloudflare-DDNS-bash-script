#!/usr/bin/env sh

# Declarations of names and ids of records.
declare -a RECORD_NAMES=("Your_name_1" "Your_name_2")
declare -a RECORD_IDS=("ID_of_your_name_1" "ID_of_your_name_2")
AUTH_EMAIL=Your_email_adress_in_cloudflare_services
AUTH_KEY=Your_authorization_key
ZONE_ID=Your_zone_id
# Retrieve the last recorded public IP address
IP_FILE="/tmp/CloudFlare_IP"

# Cheking that data was provided
if [ "$AUTH_KEY" = "Your_authorization_key" ] || [ "$AUTH_KEY" = "" ]; then
    echo "Missing Cloudflare API Key."
    exit 2
fi
if [ "$AUTH_EMAIL" = "Your_email_adress_in_cloudflare_services" ] || [ "$AUTH_EMAIL" = "" ]; then
    echo "Missing email address, used to create Cloudflare account."
    exit 2
fi
if [ ${#RECORD_NAMES[@]} = 0 ] || [ ${RECORD_NAMES[0]} = "Your_name_1" ] || [ ${RECORD_NAMES[1]} = "Your_name_2" ]; then
    echo "Missing hostname, you should provide at least one name."
    exit 2
fi
if [ "$ZONE_ID" = "" ] || [ "$ZONE_ID" = "Your_zone_id" ]; then
    echo "Missing zone ID"
    exit 2
fi
if [ ${#RECORD_IDS[@]} = 0 ] || [ ${RECORD_NAMES[0]} = "ID_of_your_name_1" ] || [ ${RECORD_IDS[1]} = "ID_of_your_name_2" ]; then
    echo "Missing record ID."
    exit 2
fi

# Checking that file exists
if [ -f $IP_FILE ]; then
    IP_FROM_FILE=$(cat $IP_FILE)
else
    IP_FROM_FILE=""
    echo "No file with old IP, dont worry script will still work, and create that file for you :)"
fi

# Get the current public IP address
ACTUAL_IP=$(curl --silent https://api.ipify.org) || exit 1

#If the public ip has not changed, nothing needs to be done, exit.
if [ "$ACTUAL_IP" = "$IP_FROM_FILE" ]; then
    echo "IP didn't change"
    exit 0
fi

# Otherwise, your Internet provider changed your public IP again.

# Loop for all our records.
for i in ${!RECORD_NAMES[@]}; do

    ID=${RECORD_IDS[$i]}
    NAMEE=${RECORD_NAMES[$i]}

    # Creating record with the new public IP address for Cloudflare using API v4
    RECORD=$(
        cat <<EOF
	{ "type": "A",
  	"name": "$NAMEE",
  	"content": "$ACTUAL_IP",
  	"ttl": 180,
  	"proxied": false }
EOF
    )

    RESPONSE=$(curl --silent "https://api.cloudflare.com/client/v4/zones/$ZONE_ID/dns_records/$ID" \
        -X PUT \
        -H "Content-Type: application/json" \
        -H "X-Auth-Email: $AUTH_EMAIL" \
        -H "X-Auth-Key: $AUTH_KEY" \
        -d "$RECORD")
# Check that response from Cloudflare is success
    if [ "$(echo $RESPONSE | grep "\"success\":true")" != "" ]; then
        # Saves new IP to file.
        echo $ACTUAL_IP >$IP_FILE
        echo "$NAMEE IP address updated successful"
    else
        echo 'Something went wrong :('
        echo "Response: $RESPONSE"
    fi
done
