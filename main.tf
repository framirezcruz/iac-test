
provider "aws" {
  region = "us-east-1"
}



resource "aws_db_instance" "example" {
  allocated_storage    = 10
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  db_name                 = "mydb"
  username             = "foo"
  password             = "foobarbaz"
  parameter_group_name = "default.mysql5.7"
  publicly_accessible  = true  # Misconfiguration: RDS is publicly accessible
  skip_final_snapshot  = true
}
