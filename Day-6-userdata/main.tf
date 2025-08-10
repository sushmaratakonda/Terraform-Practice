provider "aws" {
  
}
resource "aws_instance" "name" {
  ami = "ami-08a6efd148b1f7504"
  instance_type = "t2.micro"
  availability_zone = "us-east-1b"
  user_data = file("test.sh")
  tags = {
    Name = "dev"
  }

}