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
