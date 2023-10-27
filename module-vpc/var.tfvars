#VPC
vpc_name   = "idea-tf-main-vpc"
vpc_cidr   = "10.3.0.0/16"
vpc_region = "us-east-1"
#Subnet
vpc_availability_zones    = ["us-east-1a", "us-east-1b", "us-east-1c"]
vpc_public_subnets_cidr   = ["10.3.0.0/24", "10.3.2.0/24"]
vpc_private_subnets_cidr  = ["10.3.1.0/24", "10.3.3.0/24"]
vpc_database_subnets_cidr = ["10.3.5.0/24", "10.3.7.0/24", "10.3.9.0/24"]
#nat_gateway
reuse_nat_ips = true
##external_natip_id           =["eipalloc-0c7d85dfd341cc38a"]
external_natip_id = ["eipalloc-09aa75bb8a1b502ad"]
#Tags
vpc_public_subnet_tags_name   = "idea-tf-main-natg-public"
vpc_private_subnet_tags_name  = "idea-tf-main-app-private"
vpc_database_subnet_tags_name = "idea-tf-main-data-private"
vpc_environment               = "tf"
eks_cluster_name=""
