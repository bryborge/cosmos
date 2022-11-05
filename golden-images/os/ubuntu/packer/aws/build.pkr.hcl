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
  source "amazon-ebs.base-ubuntu-amd64" {
    name            = "22.04"
    source_ami      = "ami-005414fb846dc12d1"
    profile         = "default"
    region          = "us-west-2"
    instance_type   = var.instance_type
    ami_name        = "xsob-ubuntu-server-jammy-v${var.image_version}"
    ami_description = "xsob's preconfigured Ubuntu Server 22.04 (Jammy Jellyfish)."
  }

  # 20.04 (Focal Fossa)
  source "amazon-ebs.base-ubuntu-amd64" {
    name            = "20.04"
    source_ami      = "ami-0aab355e1bfa1e72e"
    profile         = "default"
    region          = "us-west-2"
    instance_type   = var.instance_type
    ami_name        = "xsob-ubuntu-server-focal-v${var.image_version}"
    ami_description = "xsob's preconfigured Ubuntu Server 20.04 (Focal Fossa)."
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
