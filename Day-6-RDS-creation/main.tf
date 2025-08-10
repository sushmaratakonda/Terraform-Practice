provider "aws" {
  region = "us-east-1"
}

# RDS Subnet Group
resource "aws_db_subnet_group" "default" {
  name       = "my-db-subnet-group"
  subnet_ids = ["subnet-047a1a5493dfa6a4a", "subnet-03c33ea23eefb8306"] # Replace with your actual subnet IDs

  
}

# Primary RDS Instance
resource "aws_db_instance" "primary" {
  identifier              = "my-primary-db"
  engine                  = "mysql"
  engine_version          = "8.0.42"
  instance_class          = "db.t3.micro"
  allocated_storage       = 20
  storage_type            = "gp2"
  username                = "admin"
  password                = "Admin*12345" # Change in real use, or use AWS Secrets Manager
  db_subnet_group_name    = aws_db_subnet_group.default.name
  vpc_security_group_ids  = ["sg-0134c13728838f1c3"] # Replace with your SG ID
  skip_final_snapshot     = true
  publicly_accessible     = true
  backup_retention_period = 7
}

# Read Replica
#resource "aws_db_instance" "replica" {
#  identifier             = "my-read-replica"
#  instance_class         = "db.t3.micro"
#  publicly_accessible    = false
#  replicate_source_db    = aws_db_instance.primary.identifier
#  db_subnet_group_name   = aws_db_subnet_group.default.name
#  vpc_security_group_ids = ["sg-12345678"] # Replace with your SG ID
#}
