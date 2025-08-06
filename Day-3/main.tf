provider "aws" {
  region = "ap-south-1" # change if needed
}

# 1️⃣ Create IAM Role for EC2
resource "aws_iam_role" "ec2_role" {
  name = "ec2-fullaccess-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = { Service = "ec2.amazonaws.com" },
        Action   = "sts:AssumeRole"
      }
    ]
  })
}

# 2️⃣ Attach AmazonEC2FullAccess Policy to the Role
resource "aws_iam_role_policy_attachment" "ec2_fullaccess_attach" {
  role       = aws_iam_role.ec2_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
}

# 3️⃣ Create IAM Instance Profile
resource "aws_iam_instance_profile" "ec2_profile" {
  name = "ec2-fullaccess-profile"
  role = aws_iam_role.ec2_role.name
}

# 4️⃣ Launch EC2 instance with IAM Role attached
resource "aws_instance" "dev" {
  ami                  = "ami-0d54604676873b4ec" # Change to your region’s correct AMI
  instance_type        = "t2.micro"
  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name
  subnet_id            = "subnet-06d3113837d305bbb" # Your existing subnet ID

  tags = {
    Name = "apla-ec2"
  }
}
