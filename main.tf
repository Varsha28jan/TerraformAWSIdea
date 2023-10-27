module "ec2_linux" {
  source = "./modules/module-ec2-linux"
  #linux instance
  linux_vpc_id        = module.vpc.vpc_id
  linux_instance_name = var.linux_instance_name
  linux_ami_id        = var.linux_ami_id
  linux_instance_type = var.linux_instance_type
  #linux_key_name            = var.linux_key_name
  linux_subnet_id           = module.vpc.public_subnets[0]
  linux_monitoring          = var.linux_monitoring
  linux_instance_sg_name    = var.linux_instance_sg_name
  linux_description         = var.linux_description
  linux_iam_role_name       = var.linux_iam_role_name
  linux_policy_arn          = var.linux_policy_arn
  iam_instance_profile_name = var.iam_instance_profile_name
  #kafka_sg_tag_name                 = "idea-qa-main-neptune-sg"
}


module "vpc" {
  source                    = "./modules/module-vpc"
  vpc_region                = var.vpc_region
  vpc_name                  = var.vpc_name
  vpc_cidr                  = var.vpc_cidr
  vpc_availability_zones    = var.vpc_availability_zones
  vpc_public_subnets_cidr   = var.vpc_public_subnets_cidr
  vpc_private_subnets_cidr  = var.vpc_private_subnets_cidr
  vpc_database_subnets_cidr = var.vpc_database_subnets_cidr
  reuse_nat_ips             = var.reuse_nat_ips # to reuse nat ip
  #external_natip_id             = var.external_natip_id
  vpc_public_subnet_tags_name   = var.vpc_public_subnet_tags_name
  vpc_private_subnet_tags_name  = var.vpc_private_subnet_tags_name
  vpc_database_subnet_tags_name = var.vpc_database_subnet_tags_name
  vpc_environment               = var.vpc_environment
  # eks_cluster_name              = var.eks_cluster_name
}
