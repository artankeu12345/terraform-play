output "my_public_instance_ip_addr" {
  description ="returning the public ip of my public instance"
  value = aws_instance.my_public_instance.public_ip
}

output "my_private_instance_ip_addr" {
  description ="returning the private ip of my public instance"
  value = aws_instance.my_private_instance.private_ip
}
