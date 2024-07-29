#security group for RDS

resource "aws_security_group" "Tier2_RDS_sg" {
  name        = "Tier2_RDS_sg"
  description = "security group for RDS"
  vpc_id      = aws_vpc.main_vpc.id
  provider = aws.cal

  ingress {
    description     = "RDS access"
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
#    security_groups = [aws_security_group.sg.id]
    cidr_blocks     = ["0.0.0.0/0"]

  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "RDS security group"
  }
}



#create db_instance subnet group

resource "aws_db_subnet_group" "db_instance" {
  name       = "db_instance"
  subnet_ids = [aws_subnet.private_subnet1.id, aws_subnet.private_subnet2.id]
  provider = aws.cal

  tags = {
    Name = " DB subnets"
  }
}


#create DB instance

resource "aws_db_instance" "tierdb" {
  allocated_storage    = 20
  db_name              = "mydb"
  engine               = "mysql"
  engine_version       = "8.0.33"
  instance_class       = var.db_instance_type
  username             = var.db_username
  password             = var.db_password
  parameter_group_name = "default.mysql8.0"
  vpc_security_group_ids = [aws_security_group.Tier2_RDS_sg.id]
  provider = aws.cal
  db_subnet_group_name = aws_db_subnet_group.db_instance.name
  skip_final_snapshot  = true
  publicly_accessible     = false

  tags = {
    Name = "My RDS Instance"
  }
}

