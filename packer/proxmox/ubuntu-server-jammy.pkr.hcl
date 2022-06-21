/**
 * Ubuntu Server 22.04 LTS (Jammy)
 * ---
 * Packer Template to create an Ubuntu Server (jammy) on Proxmox
 */

packer {
  required_version = ">= 1.8.0"
}

/**
 * Builder Configuration
 */
source "proxmox" "ubuntu-server-jammy" {
  // Proxmox Connection
  proxmox_url              = "${var.proxmox_api_url}"
  username                 = "${var.proxmox_api_token_id}"
  token                    = "${var.proxmox_api_token_secret}"
  insecure_skip_tls_verify = true

  // Proxmox General
  node                 = "pve"
  vm_id                = "9000"
  vm_name              = "ubuntu-server-jammy"
  template_description = "Ubuntu Server 22.04 (Jammy) Image"
  qemu_agent           = true

  // Compute Size
  cores  = "1"
  memory = "8192"

  // Hard Disk
  scsi_controller = "virtio-scsi-pci"
  disks {
    disk_size         = "100G"
    storage_pool      = "tank"
    storage_pool_type = "lvm"
    type              = "virtio"
  }

  // Network
  network_adapters {
    model    = "virtio"
    bridge   = "vmbr0"
    firewall = "false"
  }

  // Operating System
  iso_url          = "https://releases.ubuntu.com/22.04/ubuntu-22.04-live-server-amd64.iso"
  iso_checksum     = "84aeaf7823c8c61baa0ae862d0a06b03409394800000b3235854a6b38eb4856f"
  iso_storage_pool = "local"
  unmount_iso      = true

  // Cloud-Init
  cloud_init              = true
  cloud_init_storage_pool = "tank"

  // Boot Settings
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

  // Auto-install Settings
  http_directory = "http"

  // SSH Settings
  ssh_username = "${var.session_user}"
  ssh_password = "${var.session_user_password}"
  ssh_timeout  = "15m"
}

/**
 * Builder
 */
build {
  name        = "ubuntu-server-jammy"
  description = "Ubuntu Server 22.04 (Jammy) Base Image"
  sources     = ["source.proxmox.ubuntu-server-jammy"]

  provisioner "shell" {
    inline = [
      "while [ ! -f /var/lib/cloud/instance/boot-finished ]; do echo 'Waiting for cloud-init...'; sleep 1; done",
      "sudo rm /etc/ssh/ssh_host_*",
      "sudo truncate -s 0 /etc/machine-id",
      "sudo apt -y autoremove --purge",
      "sudo apt -y clean",
      "sudo apt -y autoclean",
      "sudo cloud-init clean",
      "sudo rm -f /etc/cloud/cloud.cfg.d/subiquity-disable-cloudinit-networking.cfg",
      "sudo sync"
    ]
  }

  provisioner "file" {
    source      = "files/99-pve.cfg"
    destination = "/tmp/99-pve.cfg"
  }

  provisioner "shell" {
    inline = [
      "sudo cp /tmp/99-pve.cfg /etc/cloud/cloud.cfg.d/99-pve.cfg"
    ]
  }
}
