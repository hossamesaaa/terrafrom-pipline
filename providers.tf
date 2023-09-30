provider "aws" {
  region  = var.provider_region
  profile        = "default"
  shared_credentials_file= "credentials"
  #profile = "iti"
}
