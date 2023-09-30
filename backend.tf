terraform {
  backend "s3" {
    bucket         = "terrafrom-statefile"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    #profile        = "iti"
    dynamodb_table = "terrafrom-tfstate"
  }
}
