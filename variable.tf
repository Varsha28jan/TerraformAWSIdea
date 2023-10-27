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
