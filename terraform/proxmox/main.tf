terraform {
  required_version = "1.2.3"

  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "2.9.10"
    }
  }
}

##
# PROVIDERS
#
provider "proxmox" {
  pm_api_url          = var.proxmox_api_url
  pm_api_token_id     = var.proxmox_api_token_id
  pm_api_token_secret = var.proxmox_api_token_secret
  pm_tls_insecure     = true
}

##
# RESOURCE
#
resource "proxmox_vm_qemu" "dockserv" {
  count = 1
  name  = "dockserv-vm-${count.index + 1}"

  target_node = var.proxmox_node
  clone       = var.vm_template_name

  agent    = 1
  bootdisk = "scsi0"
  cores    = 2
  cpu      = "host"
  os_type  = "cloud-init"
  memory   = 8192
  scsihw   = "virtio-scsi-pci"
  sockets  = 1

  disk {
    slot     = 0
    size     = "100G"
    type     = "scsi"
    storage  = "tank"
    iothread = 1
  }

  network {
    model  = "virtio"
    bridge = "vmbr0"
  }

  lifecycle {
    ignore_changes = [
      network,
    ]
  }

  ipconfig0 = "ip=192.168.1.9${count.index + 1}/24,gw=192.168.1.1"
}
