variable "ami-id" {
 description = "giving ami value for main.tf" 
 type = string
 default = ""
}

variable "instance_type" {
 description = "giving instance type value for main.tf" 
 type = string
 default = "t2.micro"
}