# Create a compute instance
resource "google_compute_instance" "debian_instance" {
  name         = "${var.prefix_project}-${var.environment}-${var.vm_name}"
  machine_type = "e2-micro"
  zone         = "${var.gcp_region}-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
      size  = 20  # Size in GB
      type  = "pd-standard"  # Standard persistent disk
    }
  }

  network_interface {
    network = var.google_compute_network_vpc_name
    subnetwork = var.google_compute_subnetwork_subnet_name

    # This will give the instance a public IP address
    dynamic "access_config" {
      for_each = var.is_public ? [1] : []
      content {
        // Ephemeral public IP
      }
    }
  }

  # Add labels if needed
  labels = {
    environment = "${var.environment}"
  }

  # Add tags for networking
  tags = var.network_tag
}
