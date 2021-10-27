resource "aws_instance" "my_private_instance" {
  ami           = data.aws_ami.my-ami.id
  instance_type = var.instance_type
  key_name = var.instance_key_pair
  vpc_security_group_ids = [aws_security_group.allow-ssh.id]
  subnet_id = aws_subnet.terra-priv-sub1.id
  tags = {
    Name = "my_private_instance"
  }
}
resource "aws_instance" "my_public_instance" {
  ami = data.aws_ami.my-ami.id
  instance_type = var.instance_type
  key_name = var.instance_key_pair
  vpc_security_group_ids = [aws_security_group.allow-ssh.id, aws_security_group.allow-http.id]
  subnet_id = aws_subnet.terra-pub-sub1.id
  tags = {
    Name = "my_public_instance"
  }
}