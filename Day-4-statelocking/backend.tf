terraform {
  backend "s3" {
    bucket = "vikkykannayya"
    key = "day-4/terraform.tfstate"
    region = "us-east-1"
  }
}