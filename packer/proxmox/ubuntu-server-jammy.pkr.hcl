packer {
  required_version = ">= 1.8.0"
}

##
# SOURCE
#
source "proxmox" "ubuntu-server-jammy-docker" {
  # Proxmox Connection
  proxmox_url              = var.proxmox_api_url
  username                 = var.proxmox_api_token_id
  token                    = var.proxmox_api_token_secret
  insecure_skip_tls_verify = true

  # Proxmox General
  node                 = var.proxmox_node
  vm_id                = var.vm_template_id
  vm_name              = var.vm_template_name
  template_description = "An Ubuntu Server (Jammy) image preloaded with Docker for Proxmox"
  qemu_agent           = true

  # Compute Size
  cores  = "1"
  memory = "2048"

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

  # Operating System
  iso_url          = "https://releases.ubuntu.com/22.04/ubuntu-22.04-live-server-amd64.iso"
  iso_checksum     = "84aeaf7823c8c61baa0ae862d0a06b03409394800000b3235854a6b38eb4856f"
  iso_storage_pool = "local"
  unmount_iso      = true

  # Cloud-Init
  cloud_init              = true
  cloud_init_storage_pool = var.proxmox_storage_pool

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

  # Auto-install Settings
  http_directory = "cloud-init/http"

  # SSH Settings
  ssh_username = var.session_user
  ssh_password = var.session_user_password
  ssh_timeout  = "15m"
}

##
# BUILDER
#
build {
  name        = "ubuntu-server-jammy-docker"
  description = "Ubuntu Server 22.04 (Jammy) image preloaded with Docker"
  sources     = ["source.proxmox.ubuntu-server-jammy-docker"]

  provisioner "shell" {
    script = "scripts/setup-cloud-init.sh"
  }

  provisioner "file" {
    source      = "cloud-init/files/99-pve.cfg"
    destination = "/tmp/99-pve.cfg"
  }

  provisioner "shell" {
    inline = [
      "sudo cp /tmp/99-pve.cfg /etc/cloud/cloud.cfg.d/99-pve.cfg"
    ]
  }

  provisioner "shell" {
    script = "scripts/install-docker.sh"
  }
}
