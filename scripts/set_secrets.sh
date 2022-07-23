
#!/usr/bin/env bash

set -euo pipefail

export TF_VAR_primary_user_password=$(pass homelab/dockserv/xsob_password)
export TF_VAR_proxmox_api_url=$(pass homelab/proxmox/api_url)
export TF_VAR_proxmox_api_terraform_token_id=$(pass homelab/proxmox/tf_token_id)
export TF_VAR_proxmox_api_terraform_token_secret=$(pass homelab/proxmox/tf_token_secret)
