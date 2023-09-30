resource "aws_subnet" "public_subnets" {
  count=2
  vpc_id            = aws_vpc.general_VPC.id
  cidr_block        = var.public_subnet_cidr_block[count.index]
  availability_zone = var.public_subnet_AZ[count.index] 

  tags = {
    Name = "public_subnet-${count.index}"
  }
}


resource "aws_subnet" "private_subnets" {
  count=2
  vpc_id            = aws_vpc.general_VPC.id
  cidr_block        = var.private_subnet_cidr_block[count.index]#"10.0.3.0/24"
  availability_zone = var.private_subnet_AZ[count.index]#"us-east-1a"

  tags = {
    Name = "private_subnet-${count.index}"
  }
}

# resource "aws_subnet" "public_subnet2" {
#   vpc_id            = aws_vpc.general_VPC.id
#   cidr_block        = "10.0.2.0/24"
#   availability_zone = "us-east-1b"

#   tags = {
#     Name = "public_subnet2"
#   }
# }




# resource "aws_subnet" "private_subnet2" {
#   vpc_id            = aws_vpc.general_VPC.id
#   cidr_block        = "10.0.4.0/24"
#   availability_zone = "us-east-1b"

#   tags = {
#     Name = "private_subnet2"
#   }
# }