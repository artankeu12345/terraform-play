resource "aws_security_group" "allow-http" {
  name        = "allow-http"
  description = "Allow inbound traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
      description      = "HTTP from every where"
      from_port        = 80
      to_port          = 80
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      
    }
  
  egress {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
    }

  tags = {
    Name = "allow_http"
  }
}
resource "aws_security_group" "allow-ssh" {
  name        = "allow-shh"
  description = "Allow inbound traffic"
  vpc_id      = aws_vpc.main.id


  ingress {
      description      = "ssh from VPC"
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = [aws_vpc.main.cidr_block]
      
    }
  
  egress {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
    }

  tags = {
    Name = "allow_ssh"
  }
}

resource "aws_security_group" "allow-ssh-my-ip" {
  name        = "allow-shh-to-my-ip"
  description = "Allow inbound traffic"
  vpc_id      = aws_vpc.main.id


  ingress {
      description      = "ssh from VPC"
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = [var.my-ip_cidr_block]
      
    }
  
  egress {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
    }

  tags = {
    Name = "allow_ssh_to_my_ip"
  }
}