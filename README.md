
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]



<!-- PROJECT LOGO -->
<br />
<p align="center">
  <a href="https://github.com/Zacer559/Cloudflare-DDNS-bash-script" >
    <img src="https://www.cloudflare.com/img/cf-facebook-card.png" alt="Logo" width="80" height="80">
  </a>

  <h3 align="center">Cloudflare DDNS bash script</h3>

  <p align="center">
    Server Management is an simple script written in bash for updating IP address in Cloudflare DNS services. 
    <br />
    <br />
    <a href="https://github.com/Zacer559/Cloudflare-DDNS-bash-script/issues">Report Bug</a>
    ·
    <a href="https://github.com/Zacer559/Cloudflare-DDNS-bash-script/issues">Request Feature</a>
  </p>
</p>



<!-- TABLE OF CONTENTS -->
<details open="open">
  <summary><h2 style="display: inline-block">Table of Contents :page_with_curl:</h2></summary>
  <ol>
    <li>
      <a href="#about-the-project-zap">About The Project :zap: </a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started-notebook_with_decorative_cover">Getting Started :notebook_with_decorative_cover:</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage-eyes">Usage :eyes:</a></li>
    <li><a href="#contributing-heart">Contributing :heart:</a></li>
    <li><a href="#license-page_facing_up">License :page_facing_up:</a></li>
    <li><a href="#contact-telephone_receiver">Contact :telephone_receiver:</a></li>
 <!--  <li><a href="#acknowledgements">Acknowledgements</a></li> -->
  </ol>
</details>

<!-- ABOUT THE PROJECT -->
## About The Project :zap:
This is my first hobbiest project which can help someone else in every day life. 





### Built With 

* [Bash](https://en.m.wikipedia.org/wiki/Bash_(Unix_shell))


<!-- GETTING STARTED -->
## Getting Started :notebook_with_decorative_cover:

To get a local copy up and running follow these simple steps.

### Prerequisites

* [Bash](https://en.m.wikipedia.org/wiki/Bash_(Unix_shell))
* [Git](https://git-scm.com/) 
  * Install on RPM-based Linux distros:
  * ``` sudo dnf install git-all ```
  * Install on Debian-based Linux distros:
  * ``` sudo apt install git-all ```

### Installation

1. Use your command line and clone the repository:

 ```
 git clone https://github.com/Zacer559/Cloudflare-DDNS-bash-script
```

 
2. Go to folder which you cloned: 
```
cd Cloudflare-DDNS-bash-script
```

3. Change all declaration parameters(line 4 to 9) in file to your for example using nano:
```
nano Cloudflare.sh
```



<!-- USAGE EXAMPLES -->
## Usage :eyes:
<!--
Use this space to show useful examples of how a project can be used. Additional screenshots, code examples and demos work well in this space. You may also link to more resources.

_For more examples, please refer to the [Documentation](https://example.com)_
 -->
One time run:
* ``` bash Cloudflare.sh ```

Cyclic activation (using crontab):
* Go to crontab editing:
  * ``` crontab - e ```
* Add crontab entry like this (Example - run script every 10 minutes):
  * ``` */10 * * * * /path/to/script >> /dev/null ```
  * To get more timing options check out [crontab guru](https://crontab.guru/) 
<!-- CONTRIBUTING -->
## Contributing :heart:

Contributions are what make the open source community such an amazing place to be learn, inspire, and create. Any contributions you make are **greatly appreciated**.



<!-- LICENSE -->
## License :page_facing_up:

Copyright 2020 Zacer559

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

> http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.


<!-- CONTACT -->
## Contact :telephone_receiver:

[@Super_Widower](https://twitter.com/Super_Widower) - zacer559@gmail.com

Project Link: [https://github.com/Zacer559/Cloudflare-DDNS-bash-script](https://github.com/Zacer559/Cloudflare-DDNS-bash-script)



<!-- ACKNOWLEDGEMENTS 
## Acknowledgements -->




<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/Zacer559/Cloudflare-DDNS-bash-script.svg?style=for-the-badge
[contributors-url]: https://github.com/Zacer559/Cloudflare-DDNS-bash-script/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/Zacer559/Cloudflare-DDNS-bash-script.svg?style=for-the-badge
[forks-url]: https://github.com/Zacer559/Cloudflare-DDNS-bash-script/network/members
[stars-shield]: https://img.shields.io/github/stars/Zacer559/Cloudflare-DDNS-bash-script.svg?style=for-the-badge
[stars-url]: https://github.com/Zacer559/Cloudflare-DDNS-bash-script/stargazers
[issues-shield]: https://img.shields.io/github/issues/Zacer559/Cloudflare-DDNS-bash-script.svg?style=for-the-badge
[issues-url]: https://github.com/Zacer559/Cloudflare-DDNS-bash-script/issues
[license-shield]: https://img.shields.io/github/license/Zacer559/Cloudflare-DDNS-bash-script.svg?style=for-the-badge
[license-url]: https://github.com/Zacer559/Cloudflare-DDNS-bash-script/blob/master/LICENSE.txt
