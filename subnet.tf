#Public Subnet1
resource "aws_subnet" "public_subnet1" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = var.subnet_cidr_block1
  provider = aws.cal
  availability_zone = var.availability_zone1

  tags = {
    Name = "Public Subnet1"
  }
}

#Public Subnet2
resource "aws_subnet" "public_subnet2" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = var.subnet_cidr_block2
  provider = aws.cal
  availability_zone = var.availability_zone2

  tags = {
    Name = "Public Subnet2"
  }
}

#Private Subnet1
resource "aws_subnet" "private_subnet1" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = var.subnet_cidr_block3
  provider = aws.cal
  availability_zone = var.availability_zone1

  tags = {
    Name = "Private Subnet1"
  }
}

#Private Subnet2
resource "aws_subnet" "private_subnet2" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = var.subnet_cidr_block4
  provider = aws.cal
  availability_zone = var.availability_zone2

  tags = {
    Name = "Private Subnet2"
  }
}

