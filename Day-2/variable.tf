variable "ami" {
  description = "AMI ID for the EC2 instance"
  type        = string
   default = ""
}

variable "instance_type" {
  description = "Type of EC2 instance"
  type        = string
  default = ""
}

variable "subnet_id" {
  description = "Subnet ID where the instance will be launched"
  type        = string
  default = ""
}

variable "instance_name" {
  description = "Name tag for the EC2 instance"
  type        = string
 default = "" 
}
