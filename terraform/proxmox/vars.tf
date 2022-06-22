variable "proxmox_api_url" {
  type        = string
  default     = "https://localhost:8006/api2/json"
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

variable "vm_template_name" {
  type        = string
  default     = "default-template"
  description = "The image template name."
}
