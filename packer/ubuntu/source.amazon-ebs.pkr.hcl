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

  ssh_username = "ubuntu"
}
