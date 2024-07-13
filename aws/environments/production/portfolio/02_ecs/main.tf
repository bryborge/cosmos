# To Do:
# 4. Add new load balancer to Route53 as an A-type and redirect all traffic to ECS service - []


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
  source = "../../../../modules/ecs-hosted-app/02_ecs"

  aws_account_id       = var.aws_account_id
  aws_region           = var.aws_region
  environment          = var.environment
  ecs_cluster_name     = var.cluster_name
  task_execution_name  = var.task_execution_name
  image_tag            = var.image_tag
  app_name             = var.app_name
  app_port             = var.app_port
  service_count        = var.service_count
}

output "portfolio_lb_dns" {
  value       = module.portfolio_app.lb_dns
  description = "AWS load balancer DNS Name"
}
