provider "aws" {
  region              = var.aws_region
  allowed_account_ids = [var.aws_account_id]
}

# Variables
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

# Resources
resource "aws_default_vpc" "default" {
  tags = local.tags
}
