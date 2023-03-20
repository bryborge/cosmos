provider "aws" {
  region              = var.aws_region
  allowed_account_ids = [var.aws_account_id]
  default_tags {
    tags = local.tags
  }
}

locals {
  name = "example"

  tags = {
    Name            = local.name # if this is for an EC2 this should be the hostname
    Region          = var.aws_region
    Environment     = var.environment
    Stage           = var.stage
    Service         = "ServiceName"
  }
}

# Modules
module "local_module" {
  source = "../modules"

  name  = "${local.name}-test-module"
  stage = var.stage
}

# Resource
