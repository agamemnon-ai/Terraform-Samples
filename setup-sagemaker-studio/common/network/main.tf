#-----------------------------------------------------------------
# VPC
#-----------------------------------------------------------------

resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = var.vpc_name
  }
}

#-----------------------------------------------------------------
# Public Subnet
#-----------------------------------------------------------------

resource "aws_subnet" "public_subnet_1a" {
  vpc_id     = aws_vpc.main.id
  availability_zone       = "ap-northeast-1a"
  cidr_block = var.public_subnet_a_cidr
  tags = {
    Name = var.public_subnet_name_a
  }
}

resource "aws_subnet" "public_subnet_1c" {
  vpc_id     = aws_vpc.main.id
  availability_zone       = "ap-northeast-1c"
  cidr_block = var.public_subnet_c_cidr
  tags = {
    Name = var.public_subnet_name_c
  }
}

#-----------------------------------------------------------------
# Private Subnet
#-----------------------------------------------------------------

resource "aws_subnet" "private_subnet_1a" {
  vpc_id     = aws_vpc.main.id
  availability_zone       = "ap-northeast-1a"
  cidr_block = var.private_subnet_a_cidr
  tags = {
    Name = var.private_subnet_name_a
  }
}

resource "aws_subnet" "private_subnet_1c" {
  vpc_id     = aws_vpc.main.id
  availability_zone       = "ap-northeast-1c"
  cidr_block = var.private_subnet_c_cidr
  tags = {
    Name = var.private_subnet_name_c
  }
}

#-----------------------------------------------------------------
# RouteTable
#-----------------------------------------------------------------

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name    = var.public_rt_name
  }
}

resource "aws_route_table_association" "public_rt_1a" {
  subnet_id      = aws_subnet.public_subnet_1a.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "public_rt_1c" {
  subnet_id      = aws_subnet.public_subnet_1c.id
  route_table_id = aws_route_table.public_rt.id
}


resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name    = var.private_rt_name
  }
}

resource "aws_route_table_association" "private_rt_1a" {
  subnet_id      = aws_subnet.private_subnet_1a.id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_route_table_association" "private_rt_1c" {
  subnet_id      = aws_subnet.private_subnet_1c.id
  route_table_id = aws_route_table.private_rt.id
}

#-----------------------------------------------------------------
# Gateway
#-----------------------------------------------------------------

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name    = var.igw_name
  }
}

resource "aws_route" "public_rt_igw_r" {
  route_table_id         = aws_route_table.public_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

resource "aws_eip" "nat_eip_A" {
  domain = "vpc"
}


resource "aws_nat_gateway" "ngwA" {
  allocation_id = aws_eip.nat_eip_A.id
  subnet_id     = aws_subnet.public_subnet_1a.id

  tags = {
    Name    = var.ngw_name
  }
}

resource "aws_route" "private_rt_nat_a_r" {
  route_table_id         = aws_route_table.private_rt.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.ngwA.id
}

#-----------------------------------------------------------------
# S3 VPCEndopoint
#-----------------------------------------------------------------

resource "aws_vpc_endpoint" "vpc_endpoint_s3" {
  vpc_id            = aws_vpc.main.id
  service_name      = "com.amazonaws.ap-northeast-1.s3"
  vpc_endpoint_type = "Gateway"

  tags = {
    "Name" = var.vpc_endpoint_name_to_s3
  }
}

resource "aws_vpc_endpoint_route_table_association" "private_s3" {
  vpc_endpoint_id = aws_vpc_endpoint.vpc_endpoint_s3.id
  route_table_id  = aws_route_table.private_rt.id
}