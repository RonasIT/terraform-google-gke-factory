locals {
  ci_service_account_name      = "ci-service-account"
  ingress_ip_address_name      = "nginx-controller"
}

data "google_project" "project" {
  project_id = var.project_id
}

// Networking

resource "google_compute_address" "ingress_ip_address" {
  name    = local.ingress_ip_address_name
  project = var.project_id
  region  = var.cluster_region
}

// GKE

module "gke" {
  source = "./modules/gke-factory"

  project_id                    = var.project_id
  project_name                  = var.project_name
  cluster_region                = var.cluster_region
  cluster_zones                 = var.cluster_zones
  is_prometheus_metrics_enabled = true
  ingress_ip_address            = google_compute_address.ingress_ip_address.address
  cluster_issuer_email          = "eleonov@ronasit.com"
}

resource "google_service_account" "ci_service_account" {
  account_id   = local.ci_service_account_name
  display_name = local.ci_service_account_name
  project      = var.project_id
}

resource "google_project_iam_member" "ci_service_account_editor_iam" {
  role    = "roles/editor"
  member  = "serviceAccount:${google_service_account.ci_service_account.email}"
  project = var.project_id
}

resource "google_project_iam_member" "ci_service_account_token_creator_iam" {
  role    = "roles/iam.serviceAccountTokenCreator"
  member  = "serviceAccount:${google_service_account.ci_service_account.email}"
  project = var.project_id
}

resource "google_service_account_key" "ci_service_account_key" {
  service_account_id = google_service_account.ci_service_account.id
}

resource "google_project_iam_binding" "compute_account_storage_iam" {
  role    = "roles/storage.objectViewer"
  members = ["serviceAccount:${data.google_project.project.number}-compute@developer.gserviceaccount.com"]
  project = var.project_id

  depends_on = [
    resource.google_project_service.enable_container_api
  ]
}
