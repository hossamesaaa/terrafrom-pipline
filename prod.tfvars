provider_region="eu-central-1"


# s3_region="us-east-1"
# s3_bucket="terrafrom-statefile"
# s3_key="terraform.tfstate"
# s3_dynamodb_table="terrafrom-tfstate"

instance_types="t2.micro"

vpc_cidr="10.0.0.0/16"
public_subnet_cidr=["10.0.1.0/24","10.0.2.0/24"]
public_AZ=["us-east-1a","us-east-1b"]
private_subnet_cidr=["10.0.3.0/24","10.0.4.0/24"]
private_AZ=["us-east-1a","us-east-1b"]