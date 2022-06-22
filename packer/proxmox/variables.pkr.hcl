variable "proxmox_api_url" {
  type        = string
  default     = "https://localhost:8006/api2/json/"
  description = "The URL where proxmox api can be found."
}

variable "proxmox_api_token_id" {
  type        = string
  default     = "token"
  description = "The proxmox api token id."
}

variable "proxmox_api_token_secret" {
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

variable "proxmox_storage_pool" {
  type        = string
  default     = "local-lvm"
  description = "The proxmox storage pool for the VM to use."
}

variable "vm_template_id" {
  type        = string
  default     = "9000"
  description = "The VM template id."
}

variable "vm_template_name" {
  type        = string
  default     = "ubuntu-server-jammy-docker"
  description = " The VM template name."
}

variable "session_user" {
  type        = string
  default     = "packer"
  description = "The session user name."
}

variable "session_user_password" {
  type        = string
  default     = "packer"
  description = "The session user password."
  sensitive   = true
}
