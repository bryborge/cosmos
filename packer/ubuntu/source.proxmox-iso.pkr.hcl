##
# Proxmox
# ---
# Docs: https://www.packer.io/plugins/builders/proxmox/iso
#
source "proxmox" "base-ubuntu-amd64" {
  # Connection
  proxmox_url              = local.proxmox_api_url          # required
  username                 = local.proxmox_api_token_id     # required
  token                    = local.proxmox_api_token_secret # required
  insecure_skip_tls_verify = true

  # General
  node                 = "pve" # required
  vm_id                = 9000
  vm_name              = "ubuntu-server-${var.ubuntu_version}"
  template_description = "Ubuntu Server ${var.ubuntu_version} preloaded with Docker."
  qemu_agent           = true

  # ISO
  iso_storage_pool = "local" # required
  unmount_iso      = true

  # Compute Size
  cores  = "1"
  memory = "2048"

  # Hard Disk
  scsi_controller = "virtio-scsi-pci"
  disks {
    disk_size         = "20G"
    storage_pool      = "tank"
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
  cloud_init_storage_pool = "tank"
  http_directory          = "../../cloud-init"

  // # SSH Settings
  ssh_username = local.session_user
  ssh_password = local.session_user_password
  ssh_timeout  = "15m"
}
