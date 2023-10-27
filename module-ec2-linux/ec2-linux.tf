


data "aws_ami" "amzlinux" {
most_recent = true
owners = ["amazon"]



filter {
name = "name"
values = ["amzn2-ami-hvm-*-gp2"]
}
filter {
name = "root-device-type"
values = ["ebs"]
}

filter {
name = "architecture"
values = ["x86_64"]
}

}



module "ec2_instance_linux" {
  source  = "terraform-aws-modules/ec2-instance/aws"
 
#for_each = toset(["one", "two", "three"])

  name                   = "${var.linux_instance_name}"
  ami                    = data.aws_ami.amzlinux.id
  instance_type          = "${var.linux_instance_type}"
  #key_name               = "${var.linux_key_name}"
  monitoring             = "${var.linux_monitoring}"
  vpc_security_group_ids = [aws_security_group.linux_sg.id]
  subnet_id              = "${var.linux_subnet_id}"
  
  iam_instance_profile = aws_iam_instance_profile.linux_instance_profile.name

  tags = {
    
    Environment = "tf"
  }
}

resource "aws_iam_instance_profile" "linux_instance_profile" {
  name = "${var.iam_instance_profile_name}"
  role = aws_iam_role.linux_ec2_role.name
}

locals {
    ingress_rules   = [ {
    port            = 3389
    protocol        = "tcp"
    description     = "inbound for RDP"
    cidr_blocks     = ["0.0.0.0/0"]
    prefix_list_ids = null
   }
   ]

    egress_rules    = [ {
    port            = 0
    protocol        = "-1"
    description     = "" 
    cidr_blocks     = ["0.0.0.0/0"]
    prefix_list_ids = null
   }
   ]
}

resource "aws_security_group" "linux_sg" {
  name        = "${var.linux_instance_sg_name}"
  description = "${var.linux_description}"
  vpc_id      = "${var.linux_vpc_id}"



dynamic "ingress" {
      for_each = local.ingress_rules

      content {
        description     = ingress.value.description
        from_port       = ingress.value.port
        to_port         = ingress.value.port
        cidr_blocks     =  ingress.value.cidr_blocks
        protocol        = ingress.value.protocol
        prefix_list_ids = ingress.value.prefix_list_ids
        #security_groups = ["sg-0a59807f5e1340ba3"]
      }
   }
dynamic "egress" {    
      for_each = local.egress_rules

      content {
        description     = egress.value.description
        from_port       = egress.value.port
        to_port         = egress.value.port
        protocol        = egress.value.protocol
        cidr_blocks     = egress.value.cidr_blocks
        prefix_list_ids = egress.value.prefix_list_ids
      }
   }
tags = {
    Name = "${var.linux_instance_sg_name}"
  }
}



resource "aws_iam_role" "linux_ec2_role" {
  name = "${var.linux_iam_role_name}"
  
assume_role_policy = jsonencode({
    Version = "2012-10-17"
    "Statement" = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}
resource "aws_iam_role_policy_attachment" "eks_node_group_Role_service" {
    
    role = "${aws_iam_role.linux_ec2_role.id}"
     count   = "${length(var.linux_policy_arn)}"
     policy_arn = "${var.linux_policy_arn[count.index]}"
    
}



