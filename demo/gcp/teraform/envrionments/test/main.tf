# # terraform par module
locals {
  list_zone = ["${var.gcp_region}-a", "${var.gcp_region}-b"]
}

module "network" {
	source                                 = "../../modules/03_network"
	environment                            = var.environment
  gcp_region                             = var.gcp_region
	prefix_project                         = var.prefix_project
  vpc_main_subnets_cidr                  = var.vpc_main_subnets_cidr
  ips_ssh_cidr                           = var.ips_ssh_cidr
}

module "public_compute_engine" {
	source                                 = "../../modules/04_compute_engine"
	environment                            = var.environment
  gcp_region                             = var.gcp_region
	prefix_project                         = var.prefix_project
  vm_name                                = "public"
  is_public = true
  google_compute_network_vpc_name        = module.network.google_compute_network_vpc_name
  google_compute_subnetwork_subnet_name  = module.network.google_compute_subnetwork_subnet_name
  network_tag = ["allow-ssh"]
}

module "private_compute_engine" {
  source                                 = "../../modules/04_compute_engine"
  environment                            = var.environment
  gcp_region                             = var.gcp_region
  prefix_project                         = var.prefix_project
  vm_name                                = "private"
  is_public = false
  google_compute_network_vpc_name        = module.network.google_compute_network_vpc_name
  google_compute_subnetwork_subnet_name  = module.network.google_compute_subnetwork_subnet_name
  network_tag = []
}








