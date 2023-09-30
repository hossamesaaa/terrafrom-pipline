

variable "vpc_cidr_block" {
    type=string
    default = "10.0.0.0/16"
    description = "vpc cidr block"
}

variable "public_subnet_cidr_block" {
    type=list
    description = "public subnet cidr block"
}

variable "public_subnet_AZ" {
    type=list
    description = "public subnet availability zone"
}


variable "private_subnet_cidr_block" {
    type=list
    description = "private subnet cidr block"
}

variable "private_subnet_AZ" {
    type=list
    description = "private subnet availability zone"
}


variable "vpc_tag" {
    type=string
    default = "general_VPC"
    description = "vpc tag"
}

variable "eip_tag" {
    type=string
    default = "my_eip"
    description = "elastic ip tag"
}

variable "igw_tag" {
    type=string
    default = "my_gw"
    description = "IGW tag"
}

variable "nat_tag" {
    type=string
    default = "nat_gateway"
    description = "nat gateway tag"
}

variable "private_routing_table_tag" {
    type=string
    default = "private_routing_table"
    description = "private routing table tag"
}


variable "public_routing_table_tag" {
    type=string
    default = "public_routing_table"
    description = "public routing table tag"
}