provider "aws" {
    region = "us-east-1"
  
}

# Fetch details of existing primary DB
data "aws_db_instance" "primary" {
  db_instance_identifier = "my-primary-db" # Replace with actual primary DB identifier
}  

# Fetch existing DB subnet group details
data "aws_db_subnet_group" "default" {
  name = "my-db-subnet-group" # Replace with actual subnet group name

}

#Construct ARN manually for replicate_source_db
locals {
  primary_db_arn = "arn:aws:rds:us-east-1:975050070855:db:my-primary-db"
}


# Read Replica
resource "aws_db_instance" "replica" {
  identifier             = "my-read-replica"
  instance_class         = "db.t3.micro"
  publicly_accessible    = true
  replicate_source_db    = local.primary_db_arn
  db_subnet_group_name   = data.aws_db_subnet_group.default.name
  vpc_security_group_ids = ["sg-0134c13728838f1c3"] # Replace with your SG ID
}