resource "google_project_service" "enable_servicenetworking_api" {
  project = var.project_id
  service = "servicenetworking.googleapis.com"
}

module "postgresql_production_private_access" {
  source      = "GoogleCloudPlatform/sql-db/google//modules/private_service_access"
  project_id  = var.project_id
  vpc_network = var.cluster_network.network_name
  depends_on = [
    resource.google_project_service.enable_servicenetworking_api
  ]
}

module "postgresql" {
  source  = "GoogleCloudPlatform/sql-db/google//modules/postgresql"
  version = "12.1.0"

  name                            = "${var.project_name}-${var.project_environment}"
  project_id                      = var.project_id
  database_version                = "POSTGRES_14"
  region                          = var.cluster_region
  zone                            = var.database_master_zone 
  availability_type               = "REGIONAL"
  maintenance_window_update_track = "stable"
  db_name                         = var.database_name
  db_charset                      = "UTF8"
  db_collation                    = "en_US.UTF8"
  user_name                       = var.database_user
  create_timeout                  = "2h"
  
  ip_configuration = {
    ipv4_enabled       = length(var.authorized_networks) > 0 ? true : false
    require_ssl        = false
    private_network    = var.cluster_network.network_self_link
    allocated_ip_range = null
    authorized_networks = var.authorized_networks
  }
}
