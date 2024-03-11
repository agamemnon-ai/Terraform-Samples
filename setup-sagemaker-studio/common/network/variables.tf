variable "vpc_name" {
    type = string
}

variable "public_subnet_name_a" {
    type = string
}

variable "public_subnet_name_c" {
    type = string
}

variable "private_subnet_name_a" {
    type = string
}

variable "private_subnet_name_c" {
    type = string
}

variable "vpc_cidr" {
    type = string
}

variable "public_subnet_a_cidr" {
    type = string
}

variable "public_subnet_c_cidr" {
    type = string
}

variable "private_subnet_a_cidr" {
    type = string
}

variable "private_subnet_c_cidr" {
    type = string
}

variable "public_rt_name" {
    type = string
}

variable "private_rt_name" {
    type = string
}

variable "igw_name" {
    type = string
}

variable "ngw_name" {
    type = string
}

variable "vpc_endpoint_name_to_s3" {
    type = string
}