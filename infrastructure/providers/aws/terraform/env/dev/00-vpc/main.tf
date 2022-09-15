provider "aws" {
  region              = var.region
  allowed_account_ids = [var.account_id]
}

terraform {
  required_version = "=1.2.9"
}

resource "aws_vpc" "main" {
  cidr_block       = var.main_vpc_cidr
  instance_tenancy = "default"
}
