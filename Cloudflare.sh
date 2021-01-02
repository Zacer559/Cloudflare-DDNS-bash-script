#!/usr/bin/env sh

# Declarations of names and ids of records.
declare -a RECORD_NAMES=("Your_name_1" "Your_name_2") 
declare -a RECORD_IDS=("ID_of_your_name_1" "ID_of_your_name_1")
AUTH_EMAIL=Your_email_adress_in_cloudflare_services
AUTH_KEY=Your_authorization_key
ZONE_ID=Your_zone_id

# Retrieve the last recorded public IP address
# If file does not exist script will still work properly.
IP_RECORD="/tmp/CloudFlare_IP"
RECORDED_IP=`cat $IP_RECORD`

# Get the current public IP address
PUBLIC_IP=$(curl --silent https://api.ipify.org) || exit 1

#If the public ip has not changed, nothing needs to be done, exit.
if [ "$PUBLIC_IP" = "$RECORDED_IP" ]; then
    exit 0
fi

# Otherwise, your Internet provider changed your public IP again.
# Saves new IP to file.
echo $PUBLIC_IP > $IP_RECORD
# Loop for all our records.
for i in ${!RECORD_NAMES[@]}; do

	ID=${RECORD_IDS[$i]};
	NAMEE=${RECORD_NAMES[$i]};

	# Record the new public IP address on Cloudflare using API v4
	RECORD=$(cat <<EOF 
	{ "type": "A",
  	"name": "$NAMEE",
  	"content": "$PUBLIC_IP",
  	"ttl": 180,
  	"proxied": false }
EOF
)

	curl "https://api.cloudflare.com/client/v4/zones/$ZONE_ID/dns_records/$ID" \
    	 -X PUT \
     	-H "Content-Type: application/json" \
     	-H "X-Auth-Email: $AUTH_EMAIL" \
     	-H "X-Auth-Key: $AUTH_KEY" \
     	-d "$RECORD"
done
