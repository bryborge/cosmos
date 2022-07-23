variable "primary_user_password" {
  type = string
  default = "password"
  description = "The primary user's password in the dockserv environment."
}

variable "proxmox_api_url" {
  type        = string
  default     = "https://localhost:8006/api2/json"
  description = "The URL where proxmox api can be found."
}

variable "proxmox_api_terraform_token_id" {
  type        = string
  default     = "token"
  description = "The proxmox api token id."
}

variable "proxmox_api_terraform_token_secret" {
  type        = string
  default     = "secret"
  description = "The proxmox api token secret."
  sensitive   = true
}

variable "proxmox_node" {
  type        = string
  default     = "pve"
  description = "The proxmox node on which to create the VM."
}
