resource "aws_route_table" "private_routing_table" {
  vpc_id = aws_vpc.general_VPC.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway.id
  }


  tags = {
    Name = var.private_routing_table_tag
  }
}


resource "aws_route_table_association" "private1" {
  count=2
  subnet_id      = aws_subnet.private_subnets[count.index].id
  route_table_id = aws_route_table.private_routing_table.id
}


# resource "aws_route_table_association" "private2" {
#   subnet_id      = aws_subnet.private_subnet2.id
#   route_table_id = aws_route_table.private_routing_table.id
# }