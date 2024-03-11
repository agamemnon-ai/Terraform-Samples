variable "vpc_name" {
    type = string
    default = "labo_vpc"
}

variable "public_subnet_name_a" {
    type = string
    default = "labo_public_subnet_1a"
}

variable "public_subnet_name_c" {
    type = string
    default = "labo_public_subnet_1c"
}

variable "private_subnet_name_a" {
    type = string
    default = "labo_private_subnet_1a"
}

variable "private_subnet_name_c" {
    type = string
    default = "labo_private_subnet_1c"
}

variable "vpc_cidr" {
    type = string
    default = "10.0.0.0/16"
}

variable "public_subnet_a_cidr" {
    type = string
    default = "10.0.1.0/24"
}

variable "public_subnet_c_cidr" {
    type = string
    default = "10.0.2.0/24"
}

variable "private_subnet_a_cidr" {
    type = string
    default = "10.0.3.0/24"
}

variable "private_subnet_c_cidr" {
    type = string
    default = "10.0.4.0/24"
}

variable "public_rt_name" {
    type = string
    default = "labo_public_rt"
}

variable "private_rt_name" {
    type = string
    default = "labo_private_rt"
}

variable "igw_name" {
    type = string
    default = "labo_igw"
}

variable "ngw_name" {
    type = string
    default = "labo_ngw"
}

variable "vpc_endpoint_name_to_s3" {
    type = string
    default = "labo_vpc_endpoint_to_s3"
}