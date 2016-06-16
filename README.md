# PPTP VPN Server Docker Image

This is a docker image with simple VPN (PPTP) server with _chap-secrets_ authentication.

On Docker Hub Registry: [samos123/pptp-vpn-server](https://hub.docker.com/r/samos123/pptp-vpn-server/)  
Source code on GitHub: [samos123/docker-pptp-vpn-server](https://github.com/samos123/docker-pptp-vpn-server)

PPTP uses _/etc/ppp/chap-secrets_ file to authenticate VPN users.
You need to create this file on your own and link it to docker when starting a container.

Example of _chap-secrets_ file:

````
# Secrets for authentication using PAP
# client    server      secret      acceptable local IP addresses
username    *           password    *
````


## Starting VPN server

To start VPN server as a docker container run:

````
docker run -d --privileged -p 1723:1723 --net host -v {local_path_to_chap_secrets}:/etc/ppp/chap-secrets samos123/pptp-vpn-server
````

Edit your local _chap-secrets_ file, to add or modify VPN users whenever you need.
When adding new users to _chap-secrets_ file, you don't need to restart Docker container.

## Connecting to VPN service
You can use any VPN (PPTP) client to connect to the service.
To authenticate use credentials provided in _chap-secrets_ file.



**Note:** Before starting container in `--net=host` mode, please read how networking in `host` mode works in Docker:
https://docs.docker.com/reference/run/#mode-host


## Credits and Authors

Original Author of the image is [Przemek Szalko](https://github.com/mobtitude/docker-vpn-pptp)

Minor modifications and maintenance of this image by Sam Stoelinga
