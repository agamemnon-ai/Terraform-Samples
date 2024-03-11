module "network" {
  source = "../../../common/network"
  
  vpc_name    = var.vpc_name
  
  public_subnet_name_a = var.public_subnet_name_a
  public_subnet_name_c = var.public_subnet_name_c
  private_subnet_name_a = var.private_subnet_name_a
  private_subnet_name_c = var.private_subnet_name_c
  
  vpc_cidr = var.vpc_cidr
  public_subnet_a_cidr = var.public_subnet_a_cidr
  public_subnet_c_cidr = var.public_subnet_c_cidr
  private_subnet_a_cidr = var.private_subnet_a_cidr
  private_subnet_c_cidr = var.private_subnet_c_cidr
  
  public_rt_name = var.public_rt_name
  private_rt_name = var.private_rt_name
  igw_name = var.igw_name
  ngw_name = var.ngw_name
  vpc_endpoint_name_to_s3 = var.vpc_endpoint_name_to_s3
}
