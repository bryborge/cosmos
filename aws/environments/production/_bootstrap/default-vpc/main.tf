locals {
  tags = {
    Name        = "Default VPC"
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

module "default_vpc" {
  source = "../../../../modules/default-vpc"
}

resource "aws_subnet" "default_subnet_1" {
  vpc_id                  = "vpc-0b5fe43c706844ec9"
  cidr_block              = "172.31.0.0/20"
  availability_zone       = "us-west-2c"
  map_public_ip_on_launch = true

  tags = {
    Name = "Default Subnet 1"
  }
}

resource "aws_subnet" "default_subnet_2" {
  vpc_id                  = "vpc-0b5fe43c706844ec9"
  cidr_block              = "172.31.16.0/20"
  availability_zone       = "us-west-2b"
  map_public_ip_on_launch = true

  tags = {
    Name = "Default Subnet 2"
  }
}

resource "aws_subnet" "default_subnet_3" {
  vpc_id                  = "vpc-0b5fe43c706844ec9"
  cidr_block              = "172.31.32.0/20"
  availability_zone       = "us-west-2a"
  map_public_ip_on_launch = true

  tags = {
    Name = "Default Subnet 3"
  }
}

resource "aws_subnet" "default_subnet_4" {
  vpc_id                  = "vpc-0b5fe43c706844ec9"
  cidr_block              = "172.31.48.0/20"
  availability_zone       = "us-west-2d"
  map_public_ip_on_launch = true

  tags = {
    Name = "Default Subnet 4"
  }
}
