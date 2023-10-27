
linux_vpc_id              = "vpc-0a0af04fcc3f21255"
linux_instance_name       = "idea-tf-main-linux-ec2"
linux_ami_id              = "ami-0c2b8ca1dad447f8a"
linux_instance_type       = "t3a.large"
#linux_key_name            = "idea-tf-main-key"
linux_subnet_id           ="subnet-01bd10cacf68cf71a"
linux_monitoring          = true
linux_instance_sg_name    = "idea-tf-linux-instance-sg"
linux_description         = "rule"
#kafka_sg_tag_name        = "idea-qa-main-neptune-sg"
linux_iam_role_name             = "idea-tf-linux_role"
linux_policy_arn                = ["arn:aws:iam::aws:policy/AmazonEC2FullAccess","arn:aws:iam::aws:policy/AmazonS3FullAccess"]
iam_instance_profile_name = "linux_instance_profile"
