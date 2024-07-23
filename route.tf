resource "aws_route_table" "route" {
  vpc_id = aws_vpc.main_vpc.id
  provider = aws.cal 

  route {
    cidr_block = var.igw_route
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "Internet Route"
  }
}

resource "aws_route_table_association" "route_associate1" {
  subnet_id      = aws_subnet.public_subnet1.id
  route_table_id = aws_route_table.route.id
  provider = aws.cal
}

resource "aws_route_table_association" "route_associate2" {
  subnet_id      = aws_subnet.public_subnet2.id
  route_table_id = aws_route_table.route.id
  provider = aws.cal
}

