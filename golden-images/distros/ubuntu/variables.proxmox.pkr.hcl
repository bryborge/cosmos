variable "proxmox_api_url" {
  type        = string
  description = "The URL where Proxmox can be found."
}

variable "proxmox_api_packer_token_id" {
  type        = string
  description = "The Proxmox API token id for Packer."
}

variable "proxmox_api_packer_token_secret" {
  type        = string
  description = "The Proxmox API token secret for Packer."
}

variable "proxmox_node" {
  type        = string
  default     = "c137"
  description = "The Proxmox Node on which to create the VM."
}
