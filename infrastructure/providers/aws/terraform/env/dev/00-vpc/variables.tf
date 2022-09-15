variable "account_id" {
  type        = string
  description = "The AWS account to deploy to."
}

variable "region" {
  type        = string
  description = "The AWS region to deploy to."
}

variable "main_vpc_cidr" {
  type        = string
  description = "The main VPC CIDR Block."
}
