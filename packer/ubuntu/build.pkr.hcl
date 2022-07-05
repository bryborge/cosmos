packer {
  required_version = ">= 1.8.0"

  required_plugins {
    proxmox = {
      version = ">= 1.0.8"
      source  = "github.com/hashicorp/proxmox"
    }
  }
}

build {
  name        = "ubuntu"
  description = <<EOF
This build creates machine images for ubuntu versions:
* 22.04
For the following builders:
* proxmox-iso
EOF

  source "proxmox.base-ubuntu-amd64" {
    name             = "22.04"
    iso_url          = local.ubuntu_2204_iso_url
    iso_checksum     = local.ubuntu_2204_iso_checksum
    boot_command     = local.ubuntu_2204_boot_command
    boot             = "c"
    boot_wait        = "10s"
  }

  provisioner "shell" {
    script = "scripts/setup-cloud-init.sh"
  }

  provisioner "shell" {
    script = "scripts/update-dependencies.sh"
  }

  provisioner "shell" {
    script = "scripts/install-docker.sh"
  }
}
