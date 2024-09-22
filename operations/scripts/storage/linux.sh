#!/bin/bash

# disk free 
df -h
df -a
df -T

# disk usage
du
du -h
du -a
du -s

# list
ls -al
stat <file/dir>

# list storage elements
lspci
lsblk
lsusb

# get all disk 
fdisk --list

# storage config
cat /etc/fstab

# mounts
findmnt
mount -t type device dir

# tools
sudo fdisk /dev/sdb
sudo gdisk /dev/sdc
parted

# create partition
mkfs -t ext4 /dev/sda4

ZE,FSAVAIL,FSUSED,MOUNTPOINT,HOTPLUG,RM,PTTYPE --raw

