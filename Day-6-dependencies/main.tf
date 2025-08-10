provider "aws" {
  region = "us-east-1"
  }

resource "aws_subnet" "subnet2" {
    vpc_id = aws_vpc.name.id
    cidr_block = "10.0.0.0/26"
    availability_zone = "us-east-1a"
    tags = {
      Name = "mysubnet-2"
    }
    depends_on = [ aws_s3_bucket.name ]
  }
  resource "aws_vpc" "name" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = "vikram_vpc"
    }
    

    }   
  resource "aws_s3_bucket" "name" {
    bucket = "fhfhfhfhgfcchch"
    
  }