provider "aws" {
  
}
resource "aws_instance" "name" {
  ami                    = "ami-0144277607031eca2"
  instance_type          = "t3.micro"
  subnet_id              = "subnet-009ce2fcf8bafa890"
  availability_zone = "ap-south-1a"

  tags = {
    Name = "aws-ecc2"
  }
}

resource "aws_s3_bucket" "dell"{
  bucket = "shivshankarteastall"

}
