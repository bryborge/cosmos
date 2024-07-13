resource "aws_ecr_repository" "image" {
  name = var.ecr_repo_name
}

output "ecr_repository_url" {
  value = aws_ecr_repository.image.repository_url
}
