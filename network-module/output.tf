output "vpc_id" {
  value = aws_vpc.general_VPC.id
}

output "vpc_cidr_block" {
  value = aws_vpc.general_VPC.cidr_block
}


output "pub_subnets" {
  value = aws_subnet.public_subnets
}


output "priv_subnets" {
  value = aws_subnet.private_subnets
}