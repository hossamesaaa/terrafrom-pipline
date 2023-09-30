

module "network-mod" {

    source = "./network-module"
    vpc_cidr_block=var.vpc_cidr
    public_subnet_cidr_block=var.public_subnet_cidr
    public_subnet_AZ=var.public_AZ
    private_subnet_cidr_block=var.private_subnet_cidr
    private_subnet_AZ=var.private_AZ

}