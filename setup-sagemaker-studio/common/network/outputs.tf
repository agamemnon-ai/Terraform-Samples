output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnet_1a" {
  value = aws_subnet.public_subnet_1a.id
}

output "public_subnet_1c" {
  value = aws_subnet.public_subnet_1c.id
}

output "private_subnet_1a" {
  value = aws_subnet.private_subnet_1a.id
}

output "private_subnet_1c" {
  value = aws_subnet.private_subnet_1c.id
}

output "igw" {
  value = aws_internet_gateway.igw.id
}

output "ngw" {
  value = aws_nat_gateway.ngwA.id
}

output "vpc_endpoint_s3" {
  value = aws_vpc_endpoint.vpc_endpoint_s3.id
}