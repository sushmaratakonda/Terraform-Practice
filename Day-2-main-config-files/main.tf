resource "aws_instance" "name" {
 ami = var.ami-id
 instance_type = var.instance_type
    tags = {
      name = "ec2test"
    }
  }

