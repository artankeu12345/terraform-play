resource "aws_instance" "my_private_instance" {
  ami           = data.aws_ami.my-ami.id
  # modifying simple variable to variable map
  # instance_type = var.instance_type
  instance_type = var.instance_type_map["qa"]  
  key_name = var.instance_key_pair
  vpc_security_group_ids = [aws_security_group.allow-ssh.id]
  subnet_id = aws_subnet.terra-priv-sub1.id
  tags = {
    Name = "my_private_instance"
  }
}
resource "aws_instance" "my_public_instance" {
  ami = data.aws_ami.my-ami.id
  # modifying simple variable to variable list
  # instance_type = var.instance_type 
  instance_type = var.instance_type_list[1] # [1] is the index for t3 mmicro
  key_name = var.instance_key_pair
  vpc_security_group_ids = [aws_security_group.allow-ssh.id, aws_security_group.allow-http.id, aws_security_group.allow-ssh-my-ip.id]
  subnet_id = aws_subnet.terra-pub-sub1.id
  count = 2
  tags = {
    # usage of string interpolation to rename the instance 
    Name = "my_public_instance-${var.instance_rename}-${count.index}"
  }
}



