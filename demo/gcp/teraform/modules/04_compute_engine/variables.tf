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
## Comput engine
##

variable "vm_name" {
  type = string
  description = "name vm"
  default     = ""
}

variable "network_tag" {
  type = list(string)
  description = "network tag"
  default     = []
}

variable "google_compute_network_vpc_name" {
  type = string
  description = "vpc name"
  default     = ""
}

variable "google_compute_subnetwork_subnet_name" {
  type = string
  description = "vpc subnet name"
  default     = ""
}

variable "is_public" {
  description = "Boolean to determine if the instance should have a public IP"
  type        = bool
  default     = false
}
