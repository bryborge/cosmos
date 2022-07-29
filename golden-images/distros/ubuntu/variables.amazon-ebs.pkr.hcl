locals {
  subnet_id = "subnet-03bb9f4285f4f0cd5" # Development-VPC Public 1
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "aws_development_vpc_id" {
  type        = string
  description = "The vpc id."
}
