terraform {
  backend "s3" {
    bucket = "vikkykannayyasush321"
    key = "day-4/terraform.tfstate"
    region = "us-east-1"
    use_lockfile = "true" #s3 supports this feature but terraform latest version >1.10
    dynamodb_table = "test1"
    encrypt = true
  }
}