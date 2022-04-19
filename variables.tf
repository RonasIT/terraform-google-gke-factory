variable "project_name" {
  description = "The name of the project"
}

variable "organization_id" {
  description = "The organization id for the associated services"
}

variable "billing_account" {
  description = "The ID of the billing account to associate this project with"
}

variable "folder_id" {
  description = "The ID of the folder to host this project"
}

variable "ci_serice_account_name" {
  description = "The name of service to use for CI/CD"
}

# GKE

variable "region" {
  description = "Cluster region"
}

variable "zones" {
  description = "Cluster zones"
}