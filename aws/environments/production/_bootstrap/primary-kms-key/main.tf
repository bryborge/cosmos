locals {
  tags = {
    Name        = "Primary KMS Key"
    Region      = var.aws_region
    Environment = var.environment
    GithubRepo  = "cosmos"
    GithubOrg   = "bryborge"
  }
}

provider "aws" {
  region = var.aws_region

  default_tags {
    tags = local.tags
  }
}

module "kms" {
  source = "../../../../modules/kms"

  alias       = "primary"
  description = "The primary KMS key with the default KMS policy."
}
