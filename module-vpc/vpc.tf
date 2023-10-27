
provider "aws" {
  region = var.vpc_region
  ignore_tags {
    key_prefixes = ["kubernetes.io/"]
  }
}



# NACL with Port 5439 open and source 0.0.0.0

locals {
  region = var.vpc_region
  network_acls = {
    public_inbound = [
      {
        rule_number = 100
        rule_action = "allow"
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_block  = "${var.public_cidr}"
      },
      {
        rule_number = 110
        rule_action = "allow"
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_block  = "${var.public_cidr}"
      },
      {
        rule_number = 120
        rule_action = "allow"
        from_port   = 443
        to_port     = 443
        protocol    = "tcp"
        cidr_block  = "${var.public_cidr}"
      },
      {
        rule_number = 130
        rule_action = "allow"
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_block  = "${var.public_cidr}"
      },

      {
        rule_number     = 140
        rule_action     = "allow"
        from_port       = 80
        to_port         = 80
        protocol        = "tcp"
        ipv6_cidr_block = "::/0"
      },
    ]

    public_outbound = [
      {
        rule_number = 100
        rule_action = "allow"
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_block  = "${var.public_cidr}"
      },
      {
        rule_number = 110
        rule_action = "allow"
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_block  = "${var.public_cidr}"
      },
      {
        rule_number = 120
        rule_action = "allow"
        from_port   = 443
        to_port     = 443
        protocol    = "tcp"
        cidr_block  = "${var.public_cidr}"
      },

      {
        rule_number = 130
        rule_action = "allow"
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_block  = "${var.public_cidr}"
      },


    ]



    #application inboud nacl
    app_inbound = [
      {
        rule_number = 100
        rule_action = "allow"
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_block  = "${var.public_cidr}"
      },
      {
        rule_number = 110
        rule_action = "allow"
        from_port   = 0
        to_port     = 65535
        protocol    = "tcp"
        cidr_block  = "${var.vpc_cidr}"
      }

    ]
    # NACL with Port 5439 open and source 0.0.0.0
    app_outbound = [
      {
        rule_number = 100
        rule_action = "allow"
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_block  = "${var.public_cidr}"
      },
      {
        rule_number = 110
        rule_action = "allow"
        from_port   = 0
        to_port     = 65535
        protocol    = "tcp"
        cidr_block  = "${var.public_cidr}"
      },
    ]
    #public_inbound_acl_rules and public_outbound_acl_rules

    #application inboud nacl
    database_inbound = [
      {
        rule_number = 100
        rule_action = "allow"
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_block  = "${var.public_cidr}"
      },
      {
        rule_number = 110
        rule_action = "allow"
        from_port   = 0
        to_port     = 65535
        protocol    = "tcp"
        cidr_block  = "${var.vpc_private_subnets_cidr[0]}"
      },
      {
        rule_number = 120
        rule_action = "allow"
        from_port   = 0
        to_port     = 65535
        protocol    = "tcp"
        cidr_block  = "${var.vpc_private_subnets_cidr[1]}"
      },


    ]
    # NACL with Port 5439 open and source 0.0.0.0
    database_outbound = [
      {
        rule_number = 100
        rule_action = "allow"
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_block  = "${var.public_cidr}"
      },
      {
        rule_number = 110
        rule_action = "allow"
        from_port   = 0
        to_port     = 65535
        protocol    = "tcp"
        cidr_block  = "${var.vpc_private_subnets_cidr[0]}"
      },
      {
        rule_number = 120
        rule_action = "allow"
        from_port   = 0
        to_port     = 65535
        protocol    = "tcp"
        cidr_block  = "${var.vpc_private_subnets_cidr[1]}"
      },

    ]
    #public_inbound_acl_rules and public_outbound_acl_rules



  }

}



module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  name   = var.vpc_name
  cidr   = var.vpc_cidr
  azs    = var.vpc_availability_zones
  ##redshift_subnets = "${var.redshift_cidr_subnets}"
  public_subnets                     = var.vpc_public_subnets_cidr
  private_subnets                    = var.vpc_private_subnets_cidr
  database_subnets                   = var.vpc_database_subnets_cidr
  enable_nat_gateway                 = var.natgateway_required_enable
  single_nat_gateway                 = var.single_natgateway_enable
  public_dedicated_network_acl       = var.public_nacl_flag
  public_inbound_acl_rules           = local.network_acls["public_inbound"]
  public_outbound_acl_rules          = local.network_acls["public_outbound"]
  private_dedicated_network_acl      = var.private_nacl_flag
  private_inbound_acl_rules          = local.network_acls["app_inbound"]
  private_outbound_acl_rules         = local.network_acls["app_outbound"]
  database_dedicated_network_acl     = var.database_nacl_flag
  database_inbound_acl_rules         = local.network_acls["database_inbound"]
  database_outbound_acl_rules        = local.network_acls["database_outbound"]
  create_database_subnet_route_table = true
  manage_default_network_acl         = var.default_nacl_flag
  enable_ipv6                        = var.ipv6_flag
  reuse_nat_ips                      = var.reuse_nat_ips # to reuse nat ip
  external_nat_ip_ids                = "${aws_eip.nat.*.id}"  


  public_subnet_tags = {
    Name                                             = "${var.vpc_public_subnet_tags_name}"
    "kubernetes.io/role/elb"                         = 1
    "kubernetes.io/cluster/var.eks_cluster_name" = "shared"
    "kubernetes.io/cluster/var.eks_cluster_name" = "shared"
  }

  private_subnet_tags = {
    Name                                             = "${var.vpc_private_subnet_tags_name}"
    "kubernetes.io/role/internal-elb"                = 1
    #"kubernetes.io/cluster/idea-tf-main-eks-cluster" = "owned"
  }

  database_subnet_tags = {
    Name = "${var.vpc_database_subnet_tags_name}"
  }
  tags = {
    terraform   = "true"
    environment = "${var.vpc_environment}"
  }
}
