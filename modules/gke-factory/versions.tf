terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.35.0"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "4.35.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "2.7.1"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.15.0"
    }
  }
}

