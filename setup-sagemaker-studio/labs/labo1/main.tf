module "network" {
  source = "./network"
}

module "sagemaker" {
  source = "./sagemaker"
  vpc_id = module.network.vpc_id
  private_subnet_1a_id = module.network.private_subnet_1a_id
}