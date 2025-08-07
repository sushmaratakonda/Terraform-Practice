resource "aws_instance" "name" {
  ami = "ami-08a6efd148b1f7504"
  instance_type = "t2.micro"
tags = {
    Name = "sush-dev-1"
}

}

resource "aws_vpc" "name" {
cidr_block = "10.0.0.0/16"
tags = {
    Name = "devvpc"
}
  
}