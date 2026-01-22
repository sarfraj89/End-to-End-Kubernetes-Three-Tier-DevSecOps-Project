terraform {
  required_version = "~> 1.9.3"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.30"
    }
  }

  backend "gcs" {
    bucket  = "dev-aman-tf-bucket"
    prefix  = "gke/terraform"
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}
