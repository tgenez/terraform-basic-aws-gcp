##
## Common
##

variable "aws_region" {
  description = "AWS region where resources will be created (default: Paris region)"
  default     = "eu-west-3"
}

variable "prefix_project" {
  description = "Prefix used to identify all resources related to this project"
  default     = "tgnez"
}

variable "environment" {
  description = "Environment name for resource segregation (e.g., lab, dev, staging, prod)"
  default     = "test"
}

####
### EC2
####
variable "ec2_name" {
  type = string
  description = "aws key pair name"
  default = "ec2-public"
}


variable "aws_key_pair_name" {
  type = string
  description = "aws key pair name"
  default = ""
}

variable "aws_ami_id" {
  type = string
  description = "aws ami id"
  default = ""
}

variable "subnet_id" {
  type = string
  description = "subnet id for ec2"
  default = ""
}

variable "sg_id" {
  type = string
  description = "Security group"
  default = ""
}

variable "associate_public_ip_address" {
  type = bool
  description = "if need a public ip or not"
  default = false
}
