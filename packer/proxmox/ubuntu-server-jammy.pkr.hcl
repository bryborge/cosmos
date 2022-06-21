# Ubuntu Server Jammy
# ---
# Packer Template to create an Ubuntu Server (jammy) on Proxmox

# Variables
variable "proxmox_api_url" {
  type        = string
  description = "The URL where proxmox api can be found."
}

variable "proxmox_api_token_id" {
  type        = string
  description = "The proxmox api token id."
}

variable "proxmox_api_token_secret" {
  type        = string
  description = "The proxmox api token secret."
  sensitive   = true
}

# Resource Definition
source "proxmox" "ubuntu-server-jammy" {
  # Proxmox Connection Settings
  proxmox_url = "${var.proxmox_api_url}"
  username    = "${var.proxmox_api_token_id}"
  token       = "${var.proxmox_api_token_secret}"
  insecure_skip_tls_verify = true # (Optional) Skip TLS Verification

  # General Settings
  node                 = "pve"
  vm_id                = "1000"
  vm_name              = "ubuntu-server-jammy"
  template_description = "Ubuntu Server Jammy Image"

  # OS Settings
  # (Option 1) Local ISO File
  # iso_file = "local:iso/ubuntu-22.04-live-server-amd64.iso"
  # - or -
  # (Option 2) Download ISO
  iso_url          = "https://releases.ubuntu.com/22.04/ubuntu-22.04-live-server-amd64.iso"
  iso_checksum     = "84aeaf7823c8c61baa0ae862d0a06b03409394800000b3235854a6b38eb4856f"
  iso_storage_pool = "local"
  unmount_iso      = true

  # System Settings
  qemu_agent = true

  # Hard Disk Settings
  scsi_controller = "virtio-scsi-pci"
  disks {
    disk_size         = "20G"
    // format            = "qcow2"
    storage_pool      = "cannister"
    storage_pool_type = "lvm"
    type              = "virtio"
  }

  # CPU Settings
  cores = "1"

  # Memory Settings
  memory = "2048"

  # Network Settings
  network_adapters {
    model    = "virtio"
    bridge   = "vmbr0"
    firewall = "false"
  }

  # Cloud-Init Settings
  cloud_init              = true
  cloud_init_storage_pool = "cannister"

  # PACKER Boot Commands
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

  # PACKER Autoinstall Settings
  http_directory = "http"
  # (Optional) Bind IP Address and Port
  // http_bind_address = "0.0.0.0"
  http_port_min = 8802
  http_port_max = 8802

  ssh_username = "packer"
  ssh_password = "packer"
  # - or -
  # (Option 2) Add your Private SSH KEY file here
  // communicator = "ssh"
  // ssh_agent_auth = true
  // ssh_private_key_file = "~/.ssh/id_ed25519"

  # Raise the timeout, when installation takes longer
  ssh_timeout = "15m"
}

# Build
build {
  name    = "ubuntu-server-jammy"
  sources = ["source.proxmox.ubuntu-server-jammy"]

  # Provisioning the VM Template for Cloud-Init Integration in Proxmox #1
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

  # Provisioning the VM Template for Cloud-Init Integration in Proxmox #2
  provisioner "file" {
    source      = "files/99-pve.cfg"
    destination = "/tmp/99-pve.cfg"
  }

  # Provisioning the VM Template for Cloud-Init Integration in Proxmox #3
  provisioner "shell" {
    inline = ["sudo cp /tmp/99-pve.cfg /etc/cloud/cloud.cfg.d/99-pve.cfg"]
  }
}
