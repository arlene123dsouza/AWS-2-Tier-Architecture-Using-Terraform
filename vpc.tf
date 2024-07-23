#VPC in N. California Region
resource "aws_vpc" "main_vpc" {
  cidr_block       = var.cidr_block
  instance_tenancy = "default"
  provider = aws.cal

  tags = {
    Name = "Main VPC"
  }
}

