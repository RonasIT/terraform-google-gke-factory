locals {
  storage_service_account_name = "storage-service-account1"
  ci_service_account_name      = "ci-service-account"
}

data "google_project" "project" {
  project_id = var.project_id
}

resource "google_compute_address" "ingress_ip_address" {
  name    = "${var.project_name}-${var.environment_name}-nginx-ingress-controller"
  project = var.project_id
  region  = var.cluster_region
}

module "gke" {
  source = "./modules/gke-factory"

  project_id                    = var.project_id
  project_name                  = var.project_name
  environment_name              = var.environment_name
  cluster_region                = var.cluster_region
  cluster_zones                 = var.cluster_zones
  is_prometheus_metrics_enabled = true
  ingress_ip_address            = google_compute_address.ingress_ip_address.address
  cluster_issuer_email          = var.cluster_issuer_email
  install_nginx_ingress         = var.install_nginx_ingress
  install_cert_manager          = var.install_cert_manager
}

resource "google_storage_bucket" "artifacts_bucket" {
  project                     = var.project_id
  name                        = "${var.project_name}-${var.environment_name}-artifacts"
  location                    = var.cluster_region
  uniform_bucket_level_access = false
}

resource "google_service_account" "storage_service_account" {
  account_id   = local.storage_service_account_name
  display_name = local.storage_service_account_name
  project      = var.project_id
}

resource "google_project_iam_binding" "storage_service_account_storage_iam" {
  role    = "roles/storage.admin"
  members = ["serviceAccount:${google_service_account.storage_service_account.email}"]
  project = var.project_id
}

resource "google_service_account_key" "storage_service_account_key" {
  service_account_id = google_service_account.storage_service_account.id
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

resource "google_project_default_service_accounts" "deprivilege_default_service_account" {
  project = var.project_id
  action  = "DEPRIVILEGE"
}

resource "google_project_iam_binding" "compute_account_storage_iam" {
  role    = "roles/storage.objectViewer"
  members = ["serviceAccount:${data.google_project.project.number}-compute@developer.gserviceaccount.com"]
  project = var.project_id

  depends_on = [
    module.gke
  ]
}
