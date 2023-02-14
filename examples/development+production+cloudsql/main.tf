locals {
  environment_development_name = "development"
  environment_production_name  = "production"
}

data "google_project" "project" {
  project_id = var.project_id
}

// Development

resource "google_compute_address" "ingress_ip_address_development" {
  name    = "${var.project_name}-${local.environment_development_name}-nginx"
  project = var.project_id
  region  = var.cluster_region_development
}

module "gke_development" {
  source = "../../modules/gke-factory"

  project_id                    = var.project_id
  project_name                  = var.project_name
  environment_name              = local.environment_development_name
  cluster_region                = var.cluster_region_development
  cluster_zones                 = var.cluster_zones_development
  is_prometheus_metrics_enabled = true
  ingress_ip_address            = google_compute_address.ingress_ip_address_development.address
  cluster_issuer_email          = var.cluster_issuer_email
}

resource "google_storage_bucket" "artifacts_bucket_development" {
  project                     = var.project_id
  name                        = "${var.project_name}-${local.environment_development_name}-artifacts"
  location                    = var.cluster_region_development
  uniform_bucket_level_access = false
}

// Production

resource "google_compute_address" "ingress_ip_address_production" {
  name    = "${var.project_name}-${local.environment_production_name}-nginx"
  project = var.project_id
  region  = var.cluster_region_production
}

module "gke_production" {
  source = "../../modules/gke-factory"

  project_id                    = var.project_id
  project_name                  = var.project_name
  environment_name              = local.environment_production_name
  cluster_region                = var.cluster_region_production
  cluster_zones                 = var.cluster_zones_production
  is_prometheus_metrics_enabled = true
  ingress_ip_address            = google_compute_address.ingress_ip_address_development.address
  cluster_issuer_email          = var.cluster_issuer_email
  node_pool_nodes_max_count     = 10
  nginx_controller_additional_set = [
    {
      name  = "controller.resources.limits.cpu"
      value = "250m"
      type  = "string"
    },
    {
      name  = "controller.resources.limits.memory"
      value = "256Mi"
      type  = "string"
    }
  ]

}

resource "google_storage_bucket" "artifacts_bucket_production" {
  project                     = var.project_id
  name                        = "${var.project_name}-${local.environment_production_name}-artifacts"
  location                    = var.cluster_region_production
  uniform_bucket_level_access = false
}

// CloudSQL

module "postgresql_production" {
  source = "../../modules/cloud-sql"

  project_id           = var.project_id
  project_name         = var.project_name
  environment_name     = local.environment_production_name
  cluster_region       = var.cluster_region_production
  cluster_network      = module.gke_production.network
  database_master_zone = var.database_master_zone_production
  disk_size            = 100
  database_version     = "POSTGRES_9_6"
  availability_type    = "ZONAL"
  additional_databases = [
    {
      name      = "extra_db",
      charset   = "UTF8"
      collation = "en_US.UTF8"
    }
  ]
}
