resource "aws_route_table" "public_routing_table" {
  vpc_id = aws_vpc.general_VPC.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_gw.id
  }


  tags = {
    Name = var.public_routing_table_tag
  }
}


resource "aws_route_table_association" "public1" {
  count=2
  subnet_id      = aws_subnet.public_subnets[count.index].id
  route_table_id = aws_route_table.public_routing_table.id
}


# resource "aws_route_table_association" "public2" {
#   subnet_id      = aws_subnet.public_subnet2.id
#   route_table_id = aws_route_table.public_routing_table.id
# }