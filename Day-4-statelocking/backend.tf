terraform {
  backend "s3" {
    bucket = "nareshitdevopstest"
    key = "day-4/terraform.tfstate"
    region = "us-east-1"
    #use_lockfile = "true" #s3 supports this feature but terraform latest version >1.10
    dynamodb_table = "axajxas"
    encrypt = true
  }
}