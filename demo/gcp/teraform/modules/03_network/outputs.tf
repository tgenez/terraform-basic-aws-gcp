
output "google_compute_network_vpc_name" {
  description = "Name of the vpc"
  value       = google_compute_network.vpc_network.name
}

output "google_compute_subnetwork_subnet_name" {
  description = "Name of the subnet"
  value       = google_compute_subnetwork.subnet.name
}
