#!/bin/bash

# zfs -version
# sudo apt update
# sudo apt install zfsutils-linux
# zfs --version 

sudo gdisk /dev/sdc
parted


dd if=/dev/zero of=/dev/sdc bs=512 count=1
sudo zpool create yourpool /dev/sdb b

# zpool create local-zfs mirror sdc sdd
zpool listw


cd /dev/disk/by-id
ls -alF 

zpool status


sudo zfs set compression=on yourpool 


sudo zfs set mountpoint=/mnt/yourpool yourpool 





zfs get mountpoint 


zfs get mountpoint 



sudo zfs set mountpoint=/mnt/local-zfs local-zfs
