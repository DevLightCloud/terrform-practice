output "instance_public_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.name.public_ip
}

# Show the private IP address
output "instance_private_ip" {
  description = "Private IP of the EC2 instance"
  value       = aws_instance.name.private_ip
}