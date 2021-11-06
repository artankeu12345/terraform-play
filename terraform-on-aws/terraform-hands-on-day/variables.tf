variable "aws_region" {
    type = string
    description = "my region"
    default = "us-east-1"
}
variable "main_vpc_cidr_block" {
    type = string
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
variable "my-ip_cidr_block" {
    type = string
    description = "my ip cidr bloc"
    default = "173.79.12.34/32"
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

# adding variable type list 
variable "instance_type_list" {
    type = list(string)
    description = "instance_type"
    default =["t2.micro", "t3.micro", "t2.large","t2.small" ]
}

# adding variable  type map
variable "instance_type_map" {
    type = map(string)
    description = "instance_type"
    default ={
        "dev"= "t2.micro"
        "qa"= "t3.micro"
        "prod"= "t2.large"
    }
}
# creating variable for string interpolation to rename ec2 instance 
variable "instance_rename" {
    type =string
    description = "instance renaming using sting interpolation"
    default = "amazonlinux"
    }