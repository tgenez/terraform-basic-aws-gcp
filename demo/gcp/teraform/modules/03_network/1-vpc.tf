# Create VPC
resource "google_compute_network" "vpc_network" {
  name                    = "${var.prefix_project}-${var.environment}-vpc"
  auto_create_subnetworks = false
  description            = "Custom VPC created with Terraform"
}

# Create Subnet
resource "google_compute_subnetwork" "subnet" {
  name          = "my-subnet"
  ip_cidr_range = var.vpc_main_subnets_cidr
  region        = var.gcp_region
  network       = google_compute_network.vpc_network.id

  # Enable private Google access
  private_ip_google_access = true
}
