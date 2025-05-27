resource "aws_vpc" "vpc-1" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"
  enable_dns_hostnames    = true
  enable_dns_support =  true

  tags = {
    Name = "${var.project_name}-vpc"
  }
}
# create internet gateway and attach it to vpc
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id    = aws_vpc.vpc-1.id

  tags      = {
    Name    = "${var.project_name}-igw"
  }
}

# use data source to get all avalablility zones in region
data "aws_availability_zones" "available_zones" {}


resource "aws_subnet" "public_subnet1" {
  vpc_id                  = aws_vpc.vpc-1.id
  cidr_block              = var.pub_sub_1a_cidr
  availability_zone       = data.aws_availability_zones.available_zones.names[0]
  map_public_ip_on_launch = true

  tags      = {
    Name    = "public_subnet1"
  }
}

resource "aws_subnet" "public_subnet2" {
  vpc_id                  = aws_vpc.vpc-1.id
  cidr_block              = var.pub_sub_2b_cidr
  availability_zone       = data.aws_availability_zones.available_zones.names[1]
  map_public_ip_on_launch = true

  tags      = {
    Name    = "public_subnet2"
  }
}

# create route table and add public route
resource "aws_route_table" "public_route_table" {
  vpc_id       = aws_vpc.vpc-1.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }

  tags       = {
    Name     = "public_route_table"
  }
}

# associate public subnet pub-sub-1a to public route table
resource "aws_route_table_association" "public_subnet1_route_table_association" {
  subnet_id           = aws_subnet.public_subnet1.id
  route_table_id      = aws_route_table.public_route_table.id
}

# associate public subnet az2 to "public route table"
resource "aws_route_table_association" "public_subnet2-b_route_table_association" {
  subnet_id           = aws_subnet.public_subnet2.id
  route_table_id      = aws_route_table.public_route_table.id
}


resource "aws_subnet" "private_subnet3" {
  vpc_id                   = aws_vpc.vpc-1.id
  cidr_block               = var.pri_sub_3a_cidr
  availability_zone        = data.aws_availability_zones.available_zones.names[0]
  map_public_ip_on_launch  = false

  tags      = {
    Name    = "private_subnet3"
  }
}

# create private app pri-sub-4b
resource "aws_subnet" "private_subnet4" {
  vpc_id                   = aws_vpc.vpc-1.id
  cidr_block               = var.pri_sub_4b_cidr
  availability_zone        = data.aws_availability_zones.available_zones.names[1]
  map_public_ip_on_launch  = false

  tags      = {
    Name    = "private_subnet4"
  }
}

resource "aws_subnet" "private_subnet5" {
  vpc_id                   = aws_vpc.vpc-1.id
  cidr_block               = var.pri_sub_5a_cidr
  availability_zone        = data.aws_availability_zones.available_zones.names[0]
  map_public_ip_on_launch  = false

  tags      = {
    Name    = "private_subnet5"
  }
}

resource "aws_subnet" "private_subnet6" {
  vpc_id                   = aws_vpc.vpc-1.id
  cidr_block               = var.pri_sub_6b_cidr
  availability_zone        = data.aws_availability_zones.available_zones.names[1]
  map_public_ip_on_launch  = false

  tags      = {
    Name    = "private_subnet6"
  }
}