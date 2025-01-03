##
## Common
##

variable "gcp_region" {
  description = "GCP region (default: Paris region)"
  default     = "europe-west9"
}

variable "prefix_project" {
  description = "Prefix used to identify all resources related to this project"
  default     = "tgenez"
}

variable "environment" {
  description = "Environment name for resource segregation (e.g., lab, dev, staging, prod)"
  default     = "test"
}

##
## Network
##

variable "vpc_main_subnets_cidr" {
  type        = string
  default     = ""
  description = "CIDR block for Subnet"
}

variable "ips_ssh_cidr" {
  type        = string
  default     = ""
  description = "CIDR block for authorize ip"
}
