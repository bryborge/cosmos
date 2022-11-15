provider "proxmox" {
  pm_api_url          = var.proxmox_api_url
  pm_api_token_id     = var.proxmox_api_terraform_token_id
  pm_api_token_secret = var.proxmox_api_terraform_token_secret
  pm_tls_insecure     = true
}

# Vault System requirements:
#   Small: 2 cores, 8GiB mem, 100GiB+ HDD
#   Reference: https://developer.hashicorp.com/vault/tutorials/day-one-raft/raft-reference-architecture
resource "proxmox_vm_qemu" "vault-tec" {
  count = 1
  name  = "vault-tec-${count.index + 1}"

  target_node = var.proxmox_node
  clone       = "xsob-ubuntu-server-jammy-v1.0.0"

  agent    = 1
  bootdisk = "scsi0"
  cores    = 2
  cpu      = "host"
  os_type  = "cloud-init"
  memory   = 8192
  scsihw   = "virtio-scsi-pci"
  sockets  = 1

  disk {
    iothread = 1
    size     = "100G"
    storage  = "tank"
    type     = "scsi"
  }

  network {
    model  = "virtio"
    bridge = "vmbr0"
  }

  lifecycle {
    ignore_changes = [network]
  }

  ipconfig0 = "ip=192.168.6.9${count.index + 1}/24,gw=192.168.6.1"

  connection {
    type     = "ssh"
    user     = "xsob"
    password = var.user_password
    host     = self.ssh_host
    port     = "22"
  }

  provisioner "remote-exec" {
    inline = ["sudo hostnamectl set-hostname vault-tec-${count.index + 1}"]
  }
}