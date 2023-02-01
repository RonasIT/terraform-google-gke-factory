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
  version = "13.0.1"

  name                            = "${var.project_name}-${var.environment_name}"
  project_id                      = var.project_id
  database_version                = var.database_version
  region                          = var.cluster_region
  zone                            = var.database_master_zone
  availability_type               = "REGIONAL"
  maintenance_window_update_track = "stable"
  db_name                         = var.database_name
  db_charset                      = "UTF8"
  db_collation                    = "en_US.UTF8"
  user_name                       = var.database_user
  create_timeout                  = "2h"
  disk_size                       = var.disk_size

  ip_configuration = {
    ipv4_enabled        = length(var.authorized_networks) > 0 ? true : false
    require_ssl         = false
    private_network     = var.cluster_network.network_self_link
    allocated_ip_range  = null
    authorized_networks = var.authorized_networks
  }
}
