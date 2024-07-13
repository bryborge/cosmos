variable "aws_account_id" {
  type        = string
  description = "The AWS account to deploy to."
}

variable "aws_region" {
  type        = string
  description = "The AWS region this is hosted in."
}

variable "environment" {
  type        = string
  description = "The environment to deploy to."
}

variable "ecr_repo_name" {
  type        = string
  description = "The name of the ECR repository."
}
