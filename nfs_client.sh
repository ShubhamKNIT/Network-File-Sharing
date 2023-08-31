#!/bin/bash

#bash script to setup nfs client for nfs_server
#Please read the script carefully before executing
#This script may require editing according to your needs
#Also this script requires to change client_ip and host_ip placeholder
#This method does not use encryption

# update and install nfs-common
sudo apt update
sudo apt install nfs-common

# creating a directory to mount nfs-server
sudo mkdir -p /nfs/general

# mounting the created directory
echo 'enter the host_ip'
read host_ip
sudo mount $host_ip:/mnt/volume-nyc3-01/nfs/ /nfs/general

# checking the mount condition for /nfs/general
df -h

# shows the disk usage for /nfs/general
du -sh /nfs/general

# testing the access 
sudo touch /nfs/general/test
ls -l /nfs/general/test

# mounting the remote directory
#!/bin/bash

#bash script to setup nfs client for nfs_server
#Please read the script carefully before executing
#This script may require editing according to your needs
#Also this script requires to change client_ip and host_ip placeholder
#This method does not use encryption

# update and install nfs-common
sudo apt update
sudo apt install nfs-common

# creating a directory to mount nfs-server
sudo mkdir -p /nfs/general

# mounting the created directory
echo 'enter the host_ip'
read host_ip
sudo mount $host_ip:/mnt/volume-nyc3-01/nfs/ /nfs/general

# checking the mount condition for /nfs/general
df -h

# shows the disk usage for /nfs/general
du -sh /nfs/general

# testing the access 
sudo touch /nfs/general/test
ls -l /nfs/general/test

# mounting the remote directory
sudo bash -c $host_ip:/mnt/volume-nyc3-01/nfs/    /nfs/general   nfs auto,nofail,noatime,nolock,intr,tcp,actimeo=1800 0 0

