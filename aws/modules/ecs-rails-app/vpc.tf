resource "aws_vpc" "vpc" {
  cidr_block = "${var.cidr_block_prefix}0.0/16"
}
