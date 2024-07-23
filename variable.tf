variable "cidr_block" {
  description = "VPC CIDR Range"
}

variable "availability_zone1" {
  description = "Availability zone in N. California region"
}

variable "availability_zone2" {
  description = "Availability zone in N. California region"
}

variable "subnet_cidr_block1" {
  description = "Public Subnet CIDR"
}

variable "subnet_cidr_block2" {
  description = "Public Subnet CIDR"
}

variable "subnet_cidr_block3" {
  description = "Private Subnet CIDR"
}

variable "subnet_cidr_block4" {
  description = "Private Subnet CIDR"
}

variable "igw_route" {
  description = "Route to Internet Gateway"
}

variable "instance_type" {
  description = "Type of Instance for EC2"
}

variable "ami" {
  description = "AMI of Ubuntu for EC2"
}

variable "db_instance_type" {
  description = "Type of instance for DB"
}

variable "db_username" {
  description = "Username"
}

variable "db_password" {
  description = "Password"
}

