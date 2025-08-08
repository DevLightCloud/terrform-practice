resource "aws_instance" "name" {
  ami = "ami-0d0ad8bb301edb745"
  instance_type = "t2.micro"
  subnet_id = "subnet-0778e9e06d67b4d10"
  
  
  tags = {
      Name ="Bahubali"
  }
  }
