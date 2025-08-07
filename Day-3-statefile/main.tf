provider "aws" {
  region  = "us-east-1"      # or your actual region
  profile = "default"        # only if you’re using a named profile
}

resource "aws_instance" "name" {
  ami                  = "ami-08a6efd148b1f7504"
  instance_type        = "t2.medium"
  #iam_instance_profile = "ec2-s3"
}
