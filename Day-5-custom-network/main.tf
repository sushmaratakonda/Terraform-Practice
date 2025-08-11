provider "aws" {
    
}

resource "aws_vpc" "name" {
    cidr_block = "10.0.0.0/16"
    tags = {
      Name = "sush_vpc"
    }
  
}
#subnet creation process
resource "aws_subnet" "name" {
    vpc_id = aws_vpc.name.id
    cidr_block = "10.0.0.0/24"
    tags = {
      Name = "dev-subnet"
    }
  
}

#internet gateway creation process
resource "aws_internet_gateway" "name" {
    vpc_id = aws_vpc.name.id
    tags = {
      Name = "dev-sg"
    }
  
}
#creation of route table and edit routes
resource "aws_route_table" "name" {
    vpc_id = aws_vpc.name.id
    route = {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.name.id 
    }
}

#Creation of subnet association
resource "aws_route_table_association" "name" {
    route_table_id = aws_route_table.name.id
    subnet_id = aws_subnet.name.id
}
#creation of sg
resource "aws_security_group" "allow_tls" {
name = "allow_tls"
vpc_id = aws_vpc.name.id
tags = {
  Name = "dev-sg"
}
ingress = {
    Description = "TLS from vpc"
    from_port = 22
    to_port = 22
    protocol = "TCP"
    cidr_block = ["0.0.0.0/0"]
    }
}
resource "aws_instance" "name" {
    ami = "ami-0de716d6197524dd9"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.name.id
    vpc_security_group_ids = [aws_security_group.allow_tls.id]

  }


