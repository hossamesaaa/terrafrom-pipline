provider "aws" {
  region  = var.provider_region
  profile        = "default"
  shared_credentials_files= ["credentials"]
  #profile = "iti"
}
