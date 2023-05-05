provider "proxmox" {
  pm_api_url          = var.proxmox_api_url
  pm_api_token_id     = var.proxmox_api_terraform_token_id
  pm_api_token_secret = var.proxmox_api_terraform_token_secret
  pm_tls_insecure     = true
}

resource "proxmox_vm_qemu" "dockserv" {
  name  = "dockserv"

  target_node = var.proxmox_node
  clone       = "xsob-ubuntu-server-jammy-v1.0.0"

  agent    = 1
  bootdisk = "scsi0"
  cores    = 1
  cpu      = "host"
  os_type  = "cloud-init"
  memory   = 4096
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

  ipconfig0 = "ip=192.168.1.91/24,gw=192.168.1.1"

  connection {
    type     = "ssh"
    user     = "xsob"
    password = var.user_password
    host     = "192.168.1.91"
    port     = "22"
  }
}

resource "null_resource" "set_hostname" {
  depends_on = [
    proxmox_vm_qemu.dockserv
  ]

  connection {
    type     = "ssh"
    user     = "xsob"
    password = var.user_password
    host     = "192.168.1.41"
    port     = "22"
  }
  provisioner "remote-exec" {
    inline = ["sudo hostnamectl set-hostname dockserv"]
  }
}
