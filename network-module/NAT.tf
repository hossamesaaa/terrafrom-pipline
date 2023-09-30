
resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.eip.id
  subnet_id = aws_subnet.public_subnets[0].id
  # depends_on = [aws_internet_gateway.my_gw]

  tags = {
    Name = var.nat_tag
  }
}