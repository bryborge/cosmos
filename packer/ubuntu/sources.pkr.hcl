##
# Proxmox
# ---
# Docs: https://www.packer.io/plugins/builders/proxmox/iso
#
source "proxmox" "config" {
  # Connection
  proxmox_url              = var.proxmox_api_url          # required
  username                 = var.proxmox_api_token_id     # required
  token                    = var.proxmox_api_token_secret # required
  insecure_skip_tls_verify = true

  # General
  node       = var.proxmox_node # required
  qemu_agent = true

  # ISO
  iso_url          = var.iso_url              # required
  iso_checksum     = var.iso_checksum         # required
  iso_storage_pool = var.proxmox_storage_pool # required
  unmount_iso      = true

  # Compute Size
  cores  = "1"
  memory = "1024"

  # Hard Disk
  scsi_controller = "virtio-scsi-pci"
  disks {
    disk_size         = "20G"
    storage_pool      = var.proxmox_storage_pool
    storage_pool_type = "lvm"
    type              = "virtio"
  }

  # Network
  network_adapters {
    model    = "virtio"
    bridge   = "vmbr0"
    firewall = "false"
  }

  # Cloud-Init
  # ---
  # https://ubuntu.com/server/docs/install/autoinstall
  # https://cloudinit.readthedocs.io/en/latest/topics/datasources/nocloud.html
  cloud_init              = true
  cloud_init_storage_pool = var.proxmox_storage_pool
  http_directory          = "../../cloud-init"

  # Boot Settings
  boot_command = [
    "<esc><wait>",
    "e<wait>",
    "<down><down><down><end>",
    "<bs><bs><bs><bs><wait>",
    "autoinstall ds=nocloud-net\\;s=http://{{ .HTTPIP }}:{{ .HTTPPort }}/ ---<wait>",
    "<f10><wait>"
  ]
  boot      = "c"
  boot_wait = "10s"

  // # SSH Settings
  // ssh_username = var.session_user
  // ssh_password = var.session_user_password
  // ssh_timeout  = "15m"
}

##
# Amazon Web Services (AWS)
# ---
# Docs: https://www.packer.io/plugins/datasources/amazon
#
// source "amazon-ebs" "config" {
//   ami_name             = ""
//   ami_description      = ""
//   iam_instance_profile = ""
//   instance_type        = ""
//   profile              = ""
//   region               = ""
// }

##
# Docker
# ---
# Docs: https://www.packer.io/plugins/builders/docker
#
source "docker" "config" {
  name = var.image_fullname
  image = "ubuntu:jammy"
  commit = true
}
