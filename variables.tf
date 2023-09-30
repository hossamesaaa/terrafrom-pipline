
variable "provider_region" {
    type=string
 
}

# variable "s3_region" {
#     type=string
#     default = "us-east-1"
 
# }

# variable "s3_bucket" {
#     type=string
#     default = "terrafrom-statefile"
 
# }

# variable "s3_key" {
#     type=string
#     default = "terraform.tfstate"
# }

# variable "s3_dynamodb_table" {
#     type=string
#     default = "terrafrom-tfstate"
 
# }



variable "instance_types" {
    type=string
 
}




variable "vpc_cidr" {
    type=string
 
}

variable "public_subnet_cidr" {
    type=list
    
}

variable "public_AZ" {
    type=list
    
}


variable "private_subnet_cidr" {
    type=list

}

variable "private_AZ" {
    type=list

}
