#!/usr/bin/env bash

set -euo pipefail

# Packer
export PKR_VAR_aws_development_vpc_id=$(pass aws/development-vpc/vpc_id)
export PKR_VAR_user_password=$(pass common/users/xsob/password)
export PKR_VAR_user_salt=$(pass common/users/xsob/salt)
export PKR_VAR_proxmox_api_url=$(pass homelab/proxmox/api_url)
export PKR_VAR_proxmox_api_packer_token_id=$(pass homelab/proxmox/pkr_token_id)
export PKR_VAR_proxmox_api_packer_token_secret=$(pass homelab/proxmox/pkr_token_secret)

# Terraform
export TF_VAR_aws_development_vpc_id=$(pass aws/development-vpc/vpc_id)
export TF_VAR_nas_ip=$(pass homelab/nas/private_ip)
export TF_VAR_user_password=$(pass common/users/xsob/password)
export TF_VAR_proxmox_api_url=$(pass homelab/proxmox/api_url)
export TF_VAR_proxmox_api_terraform_token_id=$(pass homelab/proxmox/tf_token_id)
export TF_VAR_proxmox_api_terraform_token_secret=$(pass homelab/proxmox/tf_token_secret)
