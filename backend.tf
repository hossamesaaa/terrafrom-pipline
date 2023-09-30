terraform {
  backend "s3" {
    bucket         = "terrafrom-statefile"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    profile        = "default"
    shared_credentials_file= "credentials"
    dynamodb_table = "terrafrom-tfstate"
  }
}
