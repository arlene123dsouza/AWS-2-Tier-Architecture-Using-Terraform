
resource "aws_instance" "server1" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id   = aws_subnet.public_subnet1.id
  security_groups = [aws_security_group.sg.id]
  availability_zone = var.availability_zone1
  associate_public_ip_address = true
  provider = aws.cal
  user_data = <<-EOF
              #!/bin/bash
              sudo apt update -y
              sudo apt install -y apache2
              sudo systemctl start apache2
              sudo systemctl enable apache2
              echo "<html><body><h1>Welcome to Server 1</h1></body></html>" | sudo tee /var/www/html/index.html
              EOF

  root_block_device {
    volume_size = 8                       # Size of the root volume in GB
    volume_type = "gp3"                   # General Purpose SSD (GP2)
  }

  tags = {
    Name = "Server1"
  }
}


resource "aws_instance" "server2" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id   = aws_subnet.public_subnet2.id
  security_groups = [aws_security_group.sg.id]
  availability_zone = var.availability_zone2
  associate_public_ip_address = true
  provider = aws.cal
  user_data = <<-EOF
              #!/bin/bash
              sudo apt update -y
              sudo apt install -y apache2
              sudo systemctl start apache2
              sudo systemctl enable apache2
              echo "<html><body><h1>Welcome to Server 2</h1></body></html>" | sudo tee /var/www/html/index.html
              EOF

  root_block_device {
    volume_size = 8                       # Size of the root volume in GB
    volume_type = "gp3"                   # General Purpose SSD (GP2)
  }

  tags = {
    Name = "Server2"
  }
}

