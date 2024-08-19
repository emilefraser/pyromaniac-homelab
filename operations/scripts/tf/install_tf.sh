#!/bin/bash

echo "install prerequisites"
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common

echo "get hahicorp gpg and write to keyrings" 
wget -O- https://apt.releases.hashicorp.com/gpg | \
gpg --dearmor | \
sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg

echo "verify default keyring"
gpg --no-default-keyring \
--keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
--fingerprint

echo "add to the sources list"
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
sudo tee /etc/apt/sources.list.d/hashicorp.list

echo "update apt"
sudo apt update

echo "install terraform"
sudo apt-get install terraform

echo "installed terraform successfully"
