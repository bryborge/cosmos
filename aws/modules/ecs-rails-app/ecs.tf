resource "aws_ecr_repository" "rails_app" {
  name = var.service_name
}

resource "aws_ecs_cluster" "rails_cluster" {
  name = var.service_name
}
