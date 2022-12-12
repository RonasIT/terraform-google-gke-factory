data "google_project" "project" {
  project_id = var.project_id
}

module "gke" {
  source  = "RonasIT/gke-factory/google"
  version = "~> 3.0.0"

  project_id                    = var.project_id
  project_name                  = var.project_name
  cluster_region                = var.cluster_region
  cluster_zones                 = var.cluster_zones
  is_prometheus_metrics_enabled = true
  cluster_issuer_email          = var.cluster_issuer_email
}
