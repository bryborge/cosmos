variable "image_version" {
  type    = string
  default = "x.x.x"
}

build {
  name        = "ubuntu"
  description = <<EOF
This build creates machine images for the following Ubuntu versions:
* 22.04
* 20.04
And the following builders:
* amazon-ebs
* proxmox-iso
EOF

  ##
  # 22.04 (Jammy Jellyfish)
  # -----------------------

  # Amazon (EBS-backed)
  source "amazon-ebs.base-ubuntu-amd64" {
    name            = "22.04"
    source_ami      = local.ubuntu_2204_base_ami
    profile         = "default"
    region          = "us-west-2"
    instance_type   = var.instance_type
    ami_name        = "xsob-ubuntu-server-jammy-v${var.image_version}"
    ami_description = "xsob's preconfigured Ubuntu Server 22.04 (Jammy Jellyfish)."
  }

  # Proxmox
  source "proxmox.base-ubuntu-amd64" {
    name                 = "22.04"
    iso_url              = local.ubuntu_2204_iso_url
    iso_checksum         = local.ubuntu_2204_iso_checksum
    boot_command         = local.ubuntu_2204_boot_command
    boot                 = "c"
    boot_wait            = "10s"
    vm_id                = 9001
    template_name        = "xsob-ubuntu-server-jammy-v${var.image_version}"
    template_description = "xsob's preconfigured Ubuntu Server 22.04 (Jammy Jellyfish)."
  }

  ##
  # 20.04 (Focal Fossa)
  # -------------------

  # Amazon (EBS-backed)
  source "amazon-ebs.base-ubuntu-amd64" {
    name            = "20.04"
    source_ami      = local.ubuntu_2004_base_ami
    profile         = "default"
    region          = "us-west-2"
    instance_type   = var.instance_type
    ami_name        = "xsob-ubuntu-server-focal-v${var.image_version}"
    ami_description = "xsob's preconfigured Ubuntu Server 20.04 (Focal Fossa)."
  }

  # Proxmox
  source "proxmox.base-ubuntu-amd64" {
    name                 = "20.04"
    iso_url              = local.ubuntu_2004_iso_url
    iso_checksum         = local.ubuntu_2004_iso_checksum
    boot_command         = local.ubuntu_2004_boot_command
    boot                 = "c"
    boot_wait            = "2s"
    vm_id                = 9000
    template_name        = "xsob-ubuntu-server-focal-v${var.image_version}"
    template_description = "xsob's preconfigured Ubuntu Server 20.04 (Focal Fossa)."
  }

  ##
  # Provisioners
  #
  provisioner "shell" {
    script = "provisioners/scripts/cleanup-cloud-init.sh"
  }

  provisioner "ansible" {
    playbook_file = "provisioners/ansible/apt.yml"
  }

  provisioner "ansible" {
    playbook_file = "provisioners/ansible/docker.yml"
  }

  provisioner "ansible" {
    playbook_file = "provisioners/ansible/users.yml"
  }
}
