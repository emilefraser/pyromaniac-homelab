#!/bin/bash

# download from
# https://cloud-images.ubuntu.com/
wget https://releases.ubuntu.com/24.04.1/ubuntu-24.04.1-desktop-amd64.iso

wget https://releases.ubuntu.com/24.04.1/ubuntu-24.04.1-live-server-amd64.iso


mv *.img /mnt/pve/platform/template/iso
