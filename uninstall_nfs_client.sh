#!/bin/bash

# Revert NFS Client Setup Changes

# Unmount the NFS share
sudo umount /nfs/general

# Remove the created directory
sudo rm -rf /nfs/general

# Remove the entry from /etc/fstab
echo 'Enter the host_ip used in the setup script:'
read host_ip
sudo sed -i "\|$host_ip:/mnt/volume-nyc3-01/nfs/|d" /etc/fstab
df -h
echo "Reverted NFS client setup changes."

# Packages to uninstall
packages_to_uninstall="nfs-common"

# Uninstall the packages
sudo apt remove --purge -y $packages_to_uninstall

echo "Reverted NFS client setup changes and uninstalled packages."
