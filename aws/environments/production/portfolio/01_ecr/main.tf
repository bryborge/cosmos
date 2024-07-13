locals {
  tags = {
    Name        = "Portfolio Site"
    Region      = var.aws_region
    Environment = var.environment
    GithubRepo  = "cosmos"
    GithubOrg   = "bryborge"
  }
}

provider "aws" {
  region              = var.aws_region
  allowed_account_ids = [var.aws_account_id]

  default_tags {
    tags = local.tags
  }
}

module "portfolio_app" {
  source = "../../../../modules/ecs-hosted-app/01_ecr"

  aws_account_id       = var.aws_account_id
  aws_region           = var.aws_region
  environment          = var.environment
  ecr_repo_name        = var.ecr_repo_name
}
