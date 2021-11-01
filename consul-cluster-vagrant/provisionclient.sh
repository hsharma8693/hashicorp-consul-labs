#!/bin/bash
 
# Step 1 - Get the necessary utilities and install them.
apt-get update
apt-get install -y unzip
 
# Step 2 - Copy the upstart script to the /etc/init folder.
mkdir -p /etc/init
cp /vagrant/consul.conf /etc/init/consul.conf
 
# Step 3 - Get the Consul Zip file and extract it.  
cd /usr/local/bin
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt-get update && sudo apt-get install consul
#wget https://releases.hashicorp.com/consul/1.10.3/consul_1.10.3_windows_amd64.zip
#unzip *.zip
#rm *.zip
 
# step 4 - Get the Consul UI
#wget https://dl.bintray.com/mitchellh/consul/0.5.2_web_ui.zip
#unzip *.zip
#rm *.zip
 
# Step 5 - Make the Consul directory.
mkdir -p /etc/consul.d
mkdir /var/consul
 
# Step 6 - Copy the server configuration.
cp $1 /etc/consul.d/config.json
 
# Step 7 - Start Consul
IFACE=`route -n | awk '$1 ~ "172.20" {print $8}'`
CIDR=`ip addr show ${IFACE} | awk '$2 ~ "172.20" {print $2}'`
IP=${CIDR%%/24}
exec consul agent -bind ${IP} -config-file=/etc/consul.d/config.json > /var/consul/client.log &
#exec consul agent -ui -config-dir=/etc/consul.d/ -bind ${IP} -client 0.0.0.0 -data-dir=/tmp/consul -enable-script-checks -retry-join=172.20.20.10 -retry-join=172.20.20.20 -retry-join=172.20.20.30 > /vagrant/logs/client.log &