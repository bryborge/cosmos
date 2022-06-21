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
