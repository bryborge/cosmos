locals {
  subnet_id = "subnet-064852bb25d9bc77a" # Development-VPC Public 1
  vpc_id    = "vpc-0d398105a81111c53"    # Development-VPC
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}
