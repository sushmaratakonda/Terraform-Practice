terraform {
  backend "s3" {
    bucket = "vikkykannayyasush321"
    key = "day-4/terraform.tfstate"
    region = "us-east-1"
  }
}