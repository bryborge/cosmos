##
# AWS (EBS backed)
# ---
# Docs: https://www.packer.io/plugins/builders/amazon/ebs
#
source "amazon-ebs" "base-ubuntu-amd64" {
  subnet_id                   = local.subnet_id
  vpc_id                      = local.vpc_id
  associate_public_ip_address = true
  ssh_interface               = "public_ip"

  user_data_file = "../cloud-init/user-data"

  communicator            = "ssh"
  ssh_username            = "ubuntu"
  temporary_key_pair_type = "ed25519"
}
