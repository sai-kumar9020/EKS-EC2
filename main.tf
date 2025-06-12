# VPC Module
module "vpc" {
  source = "./modules/vpc"
  
  vpc_cidr           = var.vpc_cidr
  availability_zones = var.availability_zones
  cluster_name       = var.cluster_name
  environment        = var.environment
  project_name       = var.project_name
}

# ECR Module
module "ecr" {
  source = "./modules/ecr"
  
  repository_name = "${var.project_name}-app"
  environment     = var.environment
  project_name    = var.project_name
}

# EKS Module
module "eks" {
  source = "./modules/eks"
  
  cluster_name                 = var.cluster_name
  cluster_version             = var.cluster_version
  vpc_id                      = module.vpc.vpc_id
  private_subnet_ids          = module.vpc.private_subnet_ids
  public_subnet_ids           = module.vpc.public_subnet_ids
  node_group_instance_types   = var.node_group_instance_types
  node_group_desired_size     = var.node_group_desired_size
  node_group_max_size         = var.node_group_max_size
  node_group_min_size         = var.node_group_min_size
  environment                 = var.environment
  project_name                = var.project_name
}