variable "aws_region" {
    type = string
    description = "my region"
    default = "us-east-1"
}
    description = "my main vpc cidr block terra vpc"
    default = "10.0.0.0/16"
}
variable "my-public-subnet_cidr_block" {
    type = string
    description = "my public subnet cidr bloc"
    default = "10.0.0.0/24"
}
variable "my-private-vpc_cidr_block" {
    type = string
    description = "my private vpc cidr bloc"
    default = "10.0.1.0/24"
}

variable "instance_type" {
    type = string
    description = "instance_type"
    default = "t2.micro"
}
variable "instance_key_pair" {
    type = string
    description = "my terraform key"
    default = "terraform-labs-key"
}
