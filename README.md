# hashicorp-consul-labs

# Overview 

This repository contains examples of labs of Consul Cluster build (in Client/Server, Cluster or Multi-DC modes) using 
Docker or Vagrant or by directly creating Server/Client Configuration file on AWS EC2.

## Requirements

- [Docker Compose](https://docs.docker.com/compose/)
- [Docker](https://docs.docker.com/get-docker/)
- [Consul] (https://www.consul.io/downloads)
- [Vagrant] (https://www.vagrantup.com/downloads)

## Demo Script Guide For Docker related Labs 

The following files are provided as demo scripts:

- Go to respective labs folder where docker-compose file is present, run "docker-compose up" to build environment or run "docker-compose down" to destroy the same.
- You will see servers and client configuration files in "Config" Folder under lab directory.
- ACL Token, Rules, Policy , TLS certs have also been added in "Certs" and "ACL" folder respectively.


## Demo Script Guide For Vagrant related Labs 

The following files are provided as demo scripts:

- Go to respective labs folder where Vagrantfile is present, run "vagrant up" to build environment or run "vagrant down" to destroy the same.
- "Scripts" folder contains set of commands need to be run on each Server/Client to install Consul binaries and run agent, services or proxies.
- You will see servers and client configuration files in "Config" Folder under lab directory.
- ACL Token, Rules, Policy , TLS certs have also been added in "Certs" and "ACL" folder respectively.
