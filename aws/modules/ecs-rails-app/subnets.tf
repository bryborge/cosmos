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
