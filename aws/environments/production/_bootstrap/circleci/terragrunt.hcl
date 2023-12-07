include {
  path = find_in_parent_folders()
}

locals {
  secrets = yamldecode(sops_decrypt_file("${get_terragrunt_dir()}/secrets.yml"))
}

inputs = { secrets = local.secrets }
