##
# AWS (EBS backed)
# ---
# Docs: https://www.packer.io/plugins/builders/amazon/ebs
#
source "amazon-ebs" "base-ubuntu-amd64" {
  source_ami_filter {
    filters = {
      name                = "ubuntu/images/*ubuntu-focal-20.04-amd64-server-*"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }

    most_recent = true
    owners      = ["099720109477"] # Canonical
  }

  subnet_id                   = "subnet-0ceb0a1e8442dd42c" # Alpheratz-VPC Public 1
  vpc_id                      = "vpc-0b0dfe60c9a67a0c1"    # Alpheratz-VPC
  associate_public_ip_address = true
  ssh_interface               = "public_ip"

  user_data_file = "../../cloud-init/user-data"

  communicator = "ssh"
  ssh_username = "ubuntu"
}
