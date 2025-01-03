terraform {
  required_version = ">= 1.7.4"
  required_providers {
      google = {
        source  = "hashicorp/google"
        version = "~> 4.0"
      }
    }
  }

provider "google" {
  # Replace with your project ID
  project = var.gcp_project
  # Replace with your desired region
  region  = var.gcp_region
}
