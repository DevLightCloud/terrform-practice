resource "aws_vpc" "main" {
  cidr_block ="10.0.0.0/16"
  tags = {
    Name = "main_vpc"
  }
}
 resource "aws_subnet" "sub"{
  vpc_id = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "ap-south-1a"
  tags ={
    Name = "private_subnet"
  }
 }

 resource "aws_subnet" "pub"{
  vpc_id =aws_vpc.main.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "ap-south-1b"
  tags = {
    Name = "public_sub"
  }
 }
  
  resource "aws_internet_gateway" "igt"{
    vpc_id = aws_vpc.main.id
    tags = {
      Name = "my-interneet-gateway"
    }
  }

  resource "aws_route_table" "rout_tab" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igt.id
  }

  tags = {
    Name = "main-route-table"
  }
}

resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.sub.id
  route_table_id = aws_route_table.rout_tab.id
}

resource "aws_security_group" "sg" {
  name        = "allow_ssh_http"
  description = "Allow SSH and HTTP"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Be cautious in production
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "main-sg"
  }
}

resource "aws_instance" "ram" {
  ami                    = "ami-0144277607031eca2"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.sub.id
  vpc_security_group_ids = [aws_security_group.sg.id]

lifecycle {
  # prevent_destroy = true
  create_before_destroy = true
  ignore_changes = [instance_type, tags]

}

  tags = {
    Name = "aws_terr"
  }
}
