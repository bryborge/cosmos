locals {
  tags = {
    Name        = "Kollections Service"
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

module "ecs_rails_app" {
  source = "../../../modules/ecs-rails-app"

  region       = var.aws_region
  service_name = "kollections"

  # Networking
  cidr_block_prefix = "10.0."

  # DB
  rds_instance_class      = "db.t4g.micro"
  storage_size            = 10
  storage_kind            = "gp2" # general purpose ssd
  db_identifier           = "kollections"
  db_engine               = "postgres"
  db_engine_version       = "14.11"
  db_name                 = "kollections_production"
  db_parameter_group_name = "default.postgres14"
}
