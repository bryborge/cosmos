resource "aws_ecr_repository" "rails_app" {
  name = var.service_name

  image_scanning_configuration {
    scan_on_push = true
  }

  encryption_configuration {
    encryption_type = "AES256"
  }
}
