terraform {
  required_version = ">= 1.2.3"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.25.0"
    }
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = "1.14.0"
    }
  }
}