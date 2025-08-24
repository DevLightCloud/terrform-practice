resource "aws_instance" "name" {
  ami                    = "ami-0144277607031eca2"
  instance_type          = "t3.micro"
  subnet_id              = "subnet-09f113a76bbdf6b91"
  availability_zone = "ap-south-1b"
    user_data = file("test.sh")
    lifecycle {
      create_before_destroy = true
    }
  tags = {
    Name = "ec2-server"
  }
}