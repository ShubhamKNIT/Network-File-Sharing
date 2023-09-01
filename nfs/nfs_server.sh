#!/bin/bash

#bash script to create a nfs server on host machine
#NOTE: This will create block storage on the server
#Please read the script carefully before executing
#This script may require editing according to your needs
#Also this script requires to change client_ip and host_ip placeholder
#This method does not use encryption

# install updates and nfs-kernel-server
sudo apt update
sudo apt install nfs-kernel-server

# creating directory owned by host's root user
sudo mkdir -p /mnt/volume-nyc3-01/nfs
ls -dl /mnt/volume-nyc3-01/nfs/

# ownership credential of the directory
sudo chown nobody:nogroup /mnt/volume-nyc3-01/nfs/

# configuration file setup for the host server
echo "enter client_ip: "
read client_ip
sudo bash -c "echo /mnt/volume-nyc3-01/nfs/    $client_ip'(rw,sync,no_subtree_check)' >> /etc/exports"


# restart nfs-server
sudo systemctl restart nfs-kernel-server

# check ufw status and firewall
# NOTE: may require enable of firewall
sudo ufw status
sudo ufw enable
sudo ufw allow from "$client_ip" to any port nfs
sudo ufw status
