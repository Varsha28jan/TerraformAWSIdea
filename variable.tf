## linux

variable "linux_instance_name" {
  type    = string
  default = ""
}
variable "linux_vpc_id" {
  type    = string
  default = ""
}
variable "linux_ami_id" {
  type    = string
  default = ""
}
variable "linux_instance_type" {
  type    = string
  default = ""
}
# variable "linux_key_name" {
#   type    = string
#   default = ""
# }
variable "linux_subnet_id" {
  type    = string
  default = ""
}
variable "linux_monitoring" {
  type    = bool
  default = true
}
variable "linux_instance_sg_name" {
  type    = string
  default = ""
}
variable "linux_description" {
  type    = string
  default = ""
}
variable "linux_iam_role_name" {
  type    = string
  default = ""
}
variable "linux_policy_arn" {
  type    = list(string)
  default = [""]
}
variable "iam_instance_profile_name" {
  type    = string
  default = ""
}



#vpc
variable "vpc_name" {
  description = "Name of the vpc"
  type        = string
  default     = ""
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC. Default value is a valid CIDR, but not acceptable by AWS and should be overridden"
  type        = string
  default     = ""
}

variable "vpc_availability_zones" {
  description = "A list of availability zones"
  type        = list(string)
  default     = [""]
}

variable "vpc_public_subnets_cidr" {
  description = "A list of public subnets "
  type        = list(string)
  default     = [""]
}

variable "vpc_private_subnets_cidr" {
  description = "A list of private subnets "
  type        = list(string)
  default     = [""]
}

variable "vpc_database_subnets_cidr" {
  description = "A list of database subnets "
  type        = list(string)
  default     = [""]
}

variable "reuse_nat_ips" {
  type    = bool
  default = false
}

variable "external_natip_id" {
  type    = list(string)
  default = [""]
}

variable "vpc_public_subnet_tags_name" {
  description = "Name of the subnet_tags"
  type        = string
  default     = ""
}

variable "vpc_private_subnet_tags_name" {
  description = "Name of the subnet_tags"
  type        = string
  default     = ""
}

variable "vpc_database_subnet_tags_name" {
  description = "Name of the subnet_tags"
  type        = string
  default     = ""
}

variable "vpc_environment" {
  description = "type of the environment"
  type        = string
  default     = ""
}

variable "vpc_region" {
  description = "aws region"
  type        = string
  default     = ""
}
#end of vpc
