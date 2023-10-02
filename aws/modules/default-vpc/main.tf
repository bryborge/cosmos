provider "aws" {
  region              = var.aws_region
  allowed_account_ids = [var.aws_account_id]
}

resource "aws_default_vpc" "default" {
  tags = {
    Name        = "Default VPC"
    Region      = var.aws_region
    Environment = var.environment
    GithubRepo  = "cosmos"
    GithubOrg   = "sonofborge"
  }
}
