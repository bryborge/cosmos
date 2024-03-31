################################################################################
#                                     VPC
################################################################################

resource "aws_vpc" "vpc" {
  cidr_block = "${var.cidr_block_prefix}0.0/16"
}

################################################################################
#                              DEFAULT ROUTE TABLE
################################################################################

resource "aws_default_route_table" "default_rtb" {
  default_route_table_id = aws_vpc.vpc.default_route_table_id
}

################################################################################
#                              DEFAULT NETWORK ACL
################################################################################

resource "aws_default_network_acl" "default_acl" {
  default_network_acl_id = aws_vpc.vpc.default_network_acl_id

  subnet_ids = [
    aws_subnet.subnet_1.id,
    aws_subnet.subnet_2.id
  ]
}

################################################################################
#                                SECURITY GROUP
################################################################################

resource "aws_default_security_group" "default_sg" {
  vpc_id                 = aws_vpc.vpc.id
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
}

################################################################################
#                                   SUBNETS
################################################################################

resource "aws_subnet" "subnet_1" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "${var.cidr_block_prefix}1.0/24"
  availability_zone = "${var.region}b"
}

resource "aws_subnet" "subnet_2" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "${var.cidr_block_prefix}2.0/24"
  availability_zone = "${var.region}c"
}

resource "aws_db_subnet_group" "db_subnet_group" {
  name       = "${var.service_name}-db-subnet-group"
  subnet_ids = [
    aws_subnet.subnet_1.id,
    aws_subnet.subnet_2.id
  ]
}
