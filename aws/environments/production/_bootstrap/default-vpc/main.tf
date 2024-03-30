locals {
  cidr_block_prefix = "172.31."

  tags = {
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

################################################################################
#                                  DEFAULT VPC
################################################################################

resource "aws_default_vpc" "default_vpc" {
  tags = {
    Name = "Default VPC"
  }
}

################################################################################
#                                DEFAULT SUBNETS
################################################################################

resource "aws_subnet" "default_subnet_1" {
  vpc_id                  = aws_default_vpc.default_vpc.id
  cidr_block              = "${local.cidr_block_prefix}0.0/20"
  availability_zone       = "${var.aws_region}c"
  map_public_ip_on_launch = true

  tags = {
    Name = "Default Subnet 1"
  }
}

resource "aws_subnet" "default_subnet_2" {
  vpc_id                  = aws_default_vpc.default_vpc.id
  cidr_block              = "${local.cidr_block_prefix}16.0/20"
  availability_zone       = "${var.aws_region}b"
  map_public_ip_on_launch = true

  tags = {
    Name = "Default Subnet 2"
  }
}

resource "aws_subnet" "default_subnet_3" {
  vpc_id                  = aws_default_vpc.default_vpc.id
  cidr_block              = "${local.cidr_block_prefix}32.0/20"
  availability_zone       = "${var.aws_region}a"
  map_public_ip_on_launch = true

  tags = {
    Name = "Default Subnet 3"
  }
}

resource "aws_subnet" "default_subnet_4" {
  vpc_id                  = aws_default_vpc.default_vpc.id
  cidr_block              = "${local.cidr_block_prefix}48.0/20"
  availability_zone       = "${var.aws_region}d"
  map_public_ip_on_launch = true

  tags = {
    Name = "Default Subnet 4"
  }
}

################################################################################
#                             DEFAULT NETWORK ACL
################################################################################

resource "aws_default_network_acl" "default_network_acl" {
  default_network_acl_id = aws_default_vpc.default_vpc.default_network_acl_id

  ingress {
    protocol   = -1
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  egress {
    protocol   = -1
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  lifecycle {
    ignore_changes = [subnet_ids]
  }

  tags = {
    Name = "Default NACL"
  }
}

################################################################################
#                            DEFAULT SECURITY GROUP
################################################################################

resource "aws_default_security_group" "default_sg" {
  vpc_id                 = aws_default_vpc.default_vpc.id
  revoke_rules_on_delete = false

  ingress {
    protocol  = -1
    self      = true
    from_port = 0
    to_port   = 0
  }

  egress {
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    to_port     = 0
  }

  tags = {
    Name = "Default SG"
  }
}

################################################################################
#                           DEFAULT INTERNET GATEWAY
################################################################################

resource "aws_internet_gateway" "default_gw" {
  vpc_id = aws_default_vpc.default_vpc.id

  tags = {
    Name = "Default IGW"
  }
}

################################################################################
#                             DEFAULT ROUTE TABLE
################################################################################

resource "aws_default_route_table" "default_rtb" {
  default_route_table_id = aws_default_vpc.default_vpc.default_route_table_id

  tags = {
    Name = "Default RTB"
  }
}

################################################################################
#                           DEFAULT DHCP OPTION SET
################################################################################

resource "aws_default_vpc_dhcp_options" "default_dhcp_opt" {
  tags = {
    Name = "Default DHCP Option Set"
  }
}
