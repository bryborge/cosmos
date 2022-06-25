##
# Image Metadata
#
variable "image_version" {
  type        = string
  default     = "0.0.1"
  description = "The image version (SemVer)."
}

variable "image_fullname" {
  type        = string
  default     = "ubuntu-22.04-golden-v${var.image_version}"
  description = "The full image name."
}

variable "image_description" {
  type        = string
  default     = "The Ubuntu 22.04 LTS (Jammy Jellyfish) 'Golden' image."
  description = "The image description."
}

##
# Operating System Image (ISO)
#
variable "iso_url" {
  type        = string
  default     = "https://releases.ubuntu.com/22.04/ubuntu-22.04-live-server-amd64.iso"
  description = "The URL for the base ISO image."
}

variable "iso_checksum" {
  type        = string
  default     = "84aeaf7823c8c61baa0ae862d0a06b03409394800000b3235854a6b38eb4856f"
  description = "The checksum for the base ISO image."
}

##
# Proxmox
#
variable "proxmox_api_url" {
  type        = string
  default     = "https://localhost:8006/api2/json"
  description = "The URL where proxmox api can be found."
}

variable "proxmox_api_token_id" {
  type        = string
  default     = "root@pam!packer"
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
  description = "The proxmox node on which to create the image."
}

variable "proxmox_storage_pool" {
  type        = string
  default     = "local-lvm"
  description = "The proxmox storage pool for the image to use."
}
