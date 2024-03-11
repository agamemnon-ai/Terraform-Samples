output "vpc_id" {
  value = module.network.vpc_id
}

output "public_subnet_1a_id" {
  value = module.network.public_subnet_1a
}

output "public_subnet_1c_id" {
  value = module.network.public_subnet_1c
}

output "private_subnet_1a_id" {
  value = module.network.private_subnet_1a
}

output "private_subnet_1c_id" {
  value = module.network.private_subnet_1c
}

output "igw_id" {
  value = module.network.igw
}

output "ngw_id" {
  value = module.network.ngw
}

output "vpc_endpoint_s3_id" {
  value = module.network.vpc_endpoint_s3
}
