resource "aws_internet_gateway" "my_gw" {
  vpc_id = aws_vpc.general_VPC.id
  depends_on = [aws_vpc.general_VPC]

  tags = {
    Name = var.igw_tag
  }
}