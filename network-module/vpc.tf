resource "aws_vpc" "general_VPC" {
  cidr_block = var.vpc_cidr_block
   tags = {
    Name = var.vpc_tag 
  }
}