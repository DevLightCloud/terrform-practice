variable "ami-id" {
    description = "insert the imi-id"
    type = string
    default = ""
}
variable "instance-type" {
    type = string
    default = ""
}

variable "subnet_id" {
  type = string
  default = ""
}