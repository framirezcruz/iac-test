provider "aws" {
  region = "us-east-1"
}



resource "aws_db_instance" "instance1" {
  allocated_storage    = 10
  identifier     = "publicly-accessible-mysql1"
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

# # resource "aws_security_group" "rds_sg" {
# #   name = "rds_sg"

# #   ingress {
# #     from_port   = 3306
# #     to_port     = 3306
# #     protocol    = "tcp"
# #     cidr_blocks = ["0.0.0.0/0"]  # Allows access from any IP address
# #   }

# #   egress {
# #     from_port   = 0
# #     to_port     = 0
# #     protocol    = "-1"
# #     cidr_blocks = ["0.0.0.0/0"]
# #   }
# # }

# Simple RDS instance that FAILS the Wiz policy
# Uses default VPC and subnets

resource "aws_db_instance" "instance2" {
  identifier     = "publicly-accessible-mysql"
  engine         = "mysql"
  engine_version = "8.0"
  instance_class = "db.t3.micro"
  
  allocated_storage = 20
  storage_type      = "gp2"

  db_name  = "exampledb"
  username = "admin"
  password = "changeme123!"

  # THIS IS THE SETTING THAT FAILS THE POLICY
  publicly_accessible = true

  skip_final_snapshot = true

#   tags = {
#     Name = "Publicly Accessible RDS"
#   }
}

resource "aws_db_instance" "instance3" {
  identifier     = "publicly-accessible-mysql"
  engine         = "mysql"
  engine_version = "8.0"
  instance_class = "db.t3.micro"
  
  allocated_storage = 20
  storage_type      = "gp2"

  db_name  = "exampledb3"
  username = "admin"
  password = "changeme123!"

  # THIS IS THE SETTING THAT FAILS THE POLICY
  publicly_accessible = true

  skip_final_snapshot = true

  tags = {
    Name = "Publicly Accessible RDS"
  }
}
