terraform {
  backend "s3" {
    bucket = "bucket-wavelight"
    key    = "day-4/terraform.tfstate"
    region = "ap-south-1"
  }
}