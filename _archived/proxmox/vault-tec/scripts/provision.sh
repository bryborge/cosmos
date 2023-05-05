#!/usr/bin/env bash

set -xe

# Resize partition
sudo growpart /dev/sda 2
sudo resize2fs /dev/sda2
sudo partprobe /dev/sda

# Install vault
wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg >/dev/null
gpg --no-default-keyring --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg --fingerprint
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install vault

# Add vault to systemd and start service
sudo systemctl enable vault.service
sudo systemctl start vault.service
