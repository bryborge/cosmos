provider "proxmox" {
  pm_api_url          = var.proxmox_api_url
  pm_api_token_id     = var.proxmox_api_terraform_token_id
  pm_api_token_secret = var.proxmox_api_terraform_token_secret
  pm_tls_insecure     = true
}

resource "proxmox_vm_qemu" "dockserv" {
  count = 1
  name  = "dockserv-${count.index + 1}"

  target_node = var.proxmox_node
  clone       = "xsob-ubuntu-server-jammy-v1.0.5"

  agent    = 1
  bootdisk = "scsi0"
  cores    = 2
  cpu      = "host"
  os_type  = "cloud-init"
  memory   = 8192
  scsihw   = "virtio-scsi-pci"
  sockets  = 1

  disk {
    iothread     = 1
    size         = "250G"
    storage      = "tank"
    type         = "scsi"
  }

  network {
    model  = "virtio"
    bridge = "vmbr0"
  }

  lifecycle {
    ignore_changes = [network]
  }

  ipconfig0 = "ip=192.168.1.9${count.index + 1}/24,gw=192.168.1.1"

  connection {
    type     = "ssh"
    user     = "xsob"
    password = var.user_password
    host     = "192.168.1.91"
    port     = "22"
  }

  provisioner "remote-exec" {
    # TODO: Break these out into provisioner scripts
    inline = [
      # 1. clone the dockserv project
      "git clone https://github.com/sonofborge/dockserv.git /home/xsob/dockserv && cd $_ && git checkout main",
      # 2. create nas media mount point
      "echo '${var.user_password}' | sudo -S mkdir -p /media/nas",
      "echo '${var.nas_ip}:<PATH/TO/SHARE> /media/nas nfs auto,defaults,nofail 0 0' > /etc/fstab", # FIXME
      "mount -a",
      # 3. set hostname
      "sudo hostnamectl set-hostname dockserv-${count.index + 1}",
    ]
  }
}
