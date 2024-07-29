terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider for N. California Region
provider "aws" {
  region = "us-west-1"
  alias = "cal"
}
