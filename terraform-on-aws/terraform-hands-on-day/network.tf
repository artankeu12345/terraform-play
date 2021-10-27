resource "aws_vpc" "main" {
  cidr_block = var.main_vpc_cidr_block
  enable_dns_support = "true" 
  enable_dns_hostnames = "true"
  tags = {
        Name = "terra-vpc"
    }

}
resource "aws_subnet" "terra-pub-sub1" {
  vpc_id = aws_vpc.main.id
  cidr_block = var.my-public-subnet_cidr_block
  map_public_ip_on_launch = "true"
  availability_zone = "us-east-1a"
  tags = {
        Name = "terra-pub-sub1"
    }
}
resource "aws_subnet" "terra-priv-sub1" {
  vpc_id = aws_vpc.main.id
  cidr_block = var.my-private-vpc_cidr_block
  availability_zone = "us-east-1a"
  tags  = {
    Name = "terra-pub-sub1"
    }
}
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main"
  }
}
resource "aws_route_table" "my_Public_Route_table" {
    vpc_id = aws_vpc.main.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.gw.id
    }

    tags = {
        Name = "Public Subnet Route Table."
    }
}

resource "aws_route_table_association" "my_public_RT_association" {
    subnet_id = aws_subnet.terra-pub-sub1.id
    route_table_id = aws_route_table.my_Public_Route_table.id
   
}

resource "aws_route_table" "my_Private_Route_table" {
    vpc_id = aws_vpc.main.id
    tags = {
        Name = "Private Subnet Route Table."
    }
}

resource "aws_route_table_association" "my_private_RT_association" {
    subnet_id = aws_subnet.terra-priv-sub1.id
    route_table_id = aws_route_table.my_Private_Route_table.id
    
}