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


variable "public_cidr" {
  description = "The CIDR block for the public"
  type        = string
  default     = "0.0.0.0/0"
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





variable "natgateway_required_enable" {
  type    = bool
  default = true
}

variable "single_natgateway_enable" {
  type    = bool
  default = true
}


variable "public_nacl_flag" {
  type    = bool
  default = true
}

variable "private_nacl_flag" {
  type    = bool
  default = true
}


variable "database_nacl_flag" {
  type    = bool
  default = true
}

variable "default_nacl_flag" {
  type    = bool
  default = true
}

variable "ipv6_flag" {
  type    = bool
  default = false
}

variable "reuse_nat_ips" {
  type    = bool
  default = false
}

/*variable "external_natip_id" {
  type    = list(string)
  default = [""]
}*/


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
variable "eks_cluster_name" {
  description = "eks_cluster_name"
  type        = string
  default     = ""
}
