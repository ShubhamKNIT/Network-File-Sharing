#!/bin/bash

# Revert NFS Server Setup Changes

# Stop the NFS server
sudo systemctl stop nfs-kernel-server

# Remove the NFS share configuration from /etc/exports
echo "Enter the client_ip used in the setup script:"
read client_ip
sudo sed -i "\|$client_ip|d" /etc/exports

# Reload the NFS configuration
sudo exportfs -a

# Remove the created directory
sudo rm -rf /mnt/volume-nyc3-01/nfs/

# Uninstall nfs-kernel-server
sudo apt purge -y nfs-kernel-server
sudo apt autoremove -y

# Check and disable UFW rules (only if you enabled UFW)
sudo ufw status
sudo ufw delete allow from "$client_ip" to any port nfs
sudo ufw disable

echo "Reverted NFS server setup changes and uninstalled packages."

