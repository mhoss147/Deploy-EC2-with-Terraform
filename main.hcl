# Cofigure the aws provider

provider "aws" {
    #version = "~> 2.0"
    region = "us-east-1"
    access_key = "AKIAZJXY53R3V"
    secret_key = "S0l8kpZE2nbC7ytwbLuie38iE+4N5"
}

## create a instance

# resource "aws_instance" "amazon" {
#   ami           = "ami-08f3d892de259504d"
#   instance_type = "t2.micro"

#   tags = {
#     Name = "moh-instance"
#   }
# }


# create a vpc

resource "aws_vpc" "moh-vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "moh-vpc"
  }
}

# create a subnet

resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.moh-vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "moh-subnet"
  }
}


# create a 2nd vpc

resource "aws_vpc" "moh-vpc-production" {
  cidr_block       = "10.1.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "moh-vpc-production"
  }
}

# create a 2nd subnet

resource "aws_subnet" "main-production" {
  vpc_id     = aws_vpc.moh-vpc-production.id
  cidr_block = "10.1.1.0/24"

  tags = {
    Name = "moh-subnet-production"
  }
}