###ec2_linux_module

linux_vpc_id        = "vpc-0a0af04fcc3f21255"
linux_instance_name = "idea-sample-main-cicd-ec2"
linux_ami_id        = "ami-0c2b8ca1dad447f8a"
linux_instance_type = "t3a.large"
#linux_key_name      = "idea-sample-main-key"
#linux_subnet_id                 = "subnet-01bd10cacf68cf71a"
linux_monitoring       = true
linux_instance_sg_name = "idea-sample-linux-instance-sg"
linux_description      = "rule"
#kafka_sg_tag_name               = "idea-qa-main-neptune-sg"
linux_iam_role_name       = "idea-sample-linux_role"
linux_policy_arn          = ["arn:aws:iam::aws:policy/AmazonEC2FullAccess", "arn:aws:iam::aws:policy/AmazonS3FullAccess"]
iam_instance_profile_name = "linux_instance_profile_sample"

###end of ec2 module


###VPC_module
vpc_name   = "idea-sample-main-vpc"
vpc_cidr   = "10.8.0.0/16"
vpc_region = "us-east-1"
#Subnet
vpc_availability_zones    = ["us-east-1a", "us-east-1b", "us-east-1c"]
vpc_public_subnets_cidr   = ["10.8.0.0/24", "10.8.2.0/24"]
vpc_private_subnets_cidr  = ["10.8.48.0/20", "10.8.16.0/20"]
vpc_database_subnets_cidr = ["10.8.34.0/24", "10.8.35.0/24", "10.8.36.0/24"]
#nat_gateway
#reuse_nat_ips = true
#external_natip_id            = ["eipalloc-0314d90da1afa9186"]
#external_natip_id = ["eipalloc-0314d90da1afa9186"]
#Tags
vpc_public_subnet_tags_name   = "idea-sample-main-natg-public"
vpc_private_subnet_tags_name  = "idea-sample-main-app-private"
vpc_database_subnet_tags_name = "idea-sample-main-data-private"
vpc_environment               = "sample"
###End of VPC_module
