provider "aws" {
  region              = var.aws_region
  allowed_account_ids = [var.aws_account_id]
}

locals {
  name = "Default VPC"

  tags = {
    Name        = local.name
    Region      = var.aws_region
    Environment = var.environment
    GithubRepo  = "cosmos"
    GithubOrg   = "sonofborge"
  }
}

module default_vpc {
  source = "../../modules/default-vpc"
  tags   = local.tags
}
