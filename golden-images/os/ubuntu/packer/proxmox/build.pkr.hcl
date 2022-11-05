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
EOF

  # 22.04 (Jammy Jellyfish)
  source "proxmox.base-ubuntu-amd64" {
    vm_id                = 9001
    name                 = "22.04"
    template_name        = "xsob-ubuntu-server-jammy-v${var.image_version}"
    template_description = "xsob's preconfigured Ubuntu Server 22.04 (Jammy Jellyfish)."
    iso_url              = "https://releases.ubuntu.com/jammy/ubuntu-22.04-live-server-amd64.iso"
    iso_checksum         = "84aeaf7823c8c61baa0ae862d0a06b03409394800000b3235854a6b38eb4856f"
    boot                 = "c"
    boot_wait            = "10s"
    boot_command         = [
      "<esc><wait>",
      "e<wait>",
      "<down><down><down><end>",
      "<bs><bs><bs><bs><wait>",
      "autoinstall ds=nocloud-net\\;s=http://{{ .HTTPIP }}:{{ .HTTPPort }}/ ---<wait>",
      "<f10><wait>"
    ]
  }

  # 20.04 (Focal Fossa)
  source "proxmox.base-ubuntu-amd64" {
    vm_id                = 9000
    name                 = "20.04"
    template_name        = "xsob-ubuntu-server-focal-v${var.image_version}"
    template_description = "xsob's preconfigured Ubuntu Server 20.04 (Focal Fossa)."
    iso_url              = "https://releases.ubuntu.com/focal/ubuntu-20.04.4-live-server-amd64.iso"
    iso_checksum         = "28ccdb56450e643bad03bb7bcf7507ce3d8d90e8bf09e38f6bd9ac298a98eaad"
    boot                 = "c"
    boot_wait            = "2s"
    boot_command         = [
      "<esc><esc><esc>",
      "<enter><wait>",
      "/casper/vmlinuz ",
      "root=/dev/sr0 ",
      "initrd=/casper/initrd ",
      "autoinstall ds=nocloud-net;s=http://{{ .HTTPIP }}:{{ .HTTPPort }}/",
      "<enter>"
    ]
  }

  provisioner "shell" {
    script = "../../scripts/cleanup-cloud-init.sh"
  }

  provisioner "ansible" {
    playbook_file   = "../../ansible/users.yml"
    extra_arguments = ["--extra-vars", "user_password=${var.user_password} user_salt=${var.user_salt}"]
  }

  provisioner "ansible" {
    playbook_file = "../../ansible/apt.yml"
  }

  provisioner "ansible" {
    playbook_file = "../../ansible/docker.yml"
  }

  provisioner "ansible" {
    playbook_file = "../../ansible/dotfiles.yml"
  }
}
