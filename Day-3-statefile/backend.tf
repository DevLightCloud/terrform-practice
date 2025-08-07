terraform {
  backend "s3" {
    bucket = "viru2141"
    key    = "Day-3/terraform.tfstate"
    region = "ap-south-1"
  }
}