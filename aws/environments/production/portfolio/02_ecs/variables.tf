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

variable "cluster_name" {
  type        = string
  description = "ECS Cluster Name."
}

variable "task_execution_name" {
  type        = string
  description = "ECS task execution name."
}

variable "image_tag" {
  type        = string
  description = "The name of the Docker image tag."
}

variable "app_name" {
  type        = string
  description = "The name of the application."
}

variable "app_port" {
  type        = number
  description = "The port the application listens on."
}

variable "service_count" {
  type        = number
  description = "The number of services to deploy."
  default     = 1
}
