locals {
  session_user          = "ubuntu"
  session_user_password = "ubuntu"
}

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

variable "user_password" {
  type        = string
  description = "The primary user password"
}

variable "user_salt" {
  type        = string
  description = "The primary user password salt"
}