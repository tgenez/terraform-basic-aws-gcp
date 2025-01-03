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

##
## Network
##

variable "availability_zones" {
  type        = list(string)
  description = "List of Availability Zones where AWS resources will be deployed for high availability"
  default     = []

  validation {
    condition     = length(var.availability_zones) > 0
    error_message = "At least one availability zone must be specified."
  }
}

variable "vpc_main_cidr" {
  default     = "10.0.0.0/16"
  description = "CIDR block of the vpc"
}

variable "vpc_main_public_subnets_cidr" {
  type        = list(any)
  default     = []
  description = "CIDR block for Public Subnet"
}

variable "vpc_main_private_subnets_cidr" {
  type        = list(any)
  default     = []
  description = "CIDR block for Private Subnet for eks control plane"
}


variable "ips_sg_ssh" {
  type = list(string)
  default = []
  description = "list ip for ssh security groups"
}
