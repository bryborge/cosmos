locals {
  account_id = "388372205874"
  region     = "us-west-2"
  env        = "production"
}

module "default_vpc" {
  source = "../../../modules/default-vpc"

  aws_account_id = local.account_id
  aws_region     = local.region
  environment    = local.env
}
