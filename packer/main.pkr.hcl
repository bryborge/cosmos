packer {
  required_version = ">= 1.8.0"
}

build {
  name        = "baseos-template"
  description = "Ubuntu Server 22.04 (Jammy) image preloaded with Docker"
  sources     = ["source.proxmox.baseos-template"]

  provisioner "shell" {
    script = "scripts/setup-cloud-init.sh"
  }

  provisioner "shell" {
    script = "scripts/install-docker.sh"
  }
}
