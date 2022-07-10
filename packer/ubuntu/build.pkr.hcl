build {
  name        = "ubuntu"
  description = <<EOF
This build creates machine images for ubuntu versions:
* 22.04
* 20.04
For the following builders:
* amazon-ebs
* proxmox-iso
EOF

  ##
  # Proxmox Builds
  #
  source "proxmox.base-ubuntu-amd64" {
    name                 = "22.04"
    iso_url              = local.ubuntu_2204_iso_url
    iso_checksum         = local.ubuntu_2204_iso_checksum
    boot_command         = local.ubuntu_2204_boot_command
    boot                 = "c"
    boot_wait            = "10s"
    vm_id                = 9001
    vm_name              = "xsob-ubuntu-server-22.04"
    template_description = "Custom Ubuntu Server 22.04."
  }

  source "proxmox.base-ubuntu-amd64" {
    name                 = "20.04"
    iso_url              = local.ubuntu_2004_iso_url
    iso_checksum         = local.ubuntu_2004_iso_checksum
    boot_command         = local.ubuntu_2004_boot_command
    boot                 = "c"
    boot_wait            = "2s"
    vm_id                = 9000
    vm_name              = "xsob-ubuntu-server-20.04"
    template_description = "Custom Ubuntu Server 20.04."
  }

  ##
  # AWS Builds
  #
  source "amazon-ebs.base-ubuntu-amd64" {
    name            = "22.04"
    source_ami      = local.ubuntu_2204_base_ami
    profile         = "default"
    region          = "us-west-2"
    instance_type   = local.instance_type
    ami_name        = "xsob-ubuntu-server-22.04"
    ami_description = "Custom Ubuntu Server 22.04."
  }

  source "amazon-ebs.base-ubuntu-amd64" {
    name            = "20.04"
    source_ami      = local.ubuntu_2004_base_ami
    profile         = "default"
    region          = "us-west-2"
    instance_type   = local.instance_type
    ami_name        = "xsob-ubuntu-server-20.04"
    ami_description = "Custom Ubuntu Server 20.04."
  }

  ##
  # Provisioners
  #
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
