locals {
  tags = {
    Name        = "Default VPC"
    Region      = var.aws_region
    Environment = var.environment
    GithubRepo  = "cosmos"
    GithubOrg   = "bryborge"
  }
}

provider "aws" {
  region              = var.aws_region
  allowed_account_ids = [var.aws_account_id]
}

module "default_vpc" {
  source = "../../../../modules/default-vpc"
}
