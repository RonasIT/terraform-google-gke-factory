module "project-factory" {
  locals {
    network_name                   = "${var.project_name}-vpc"
    subnet_name                    = "${var.project_name}-${var.region}-01"
    secondary_ranges_pods_name     = "${var.project_name}-${var.region}-01-pods"
    secondary_ranges_services_name = "${var.project_name}-${var.region}-01-services"
    gke_name                       = "${var.project_name}-gke"
    node_pools_name                = "${var.project_name}-node-pool-main"
    cloud_router_name              = "${var.project_name}-router"
  }

  module "project" {
    source                  = "terraform-google-modules/project-factory/google"
    random_project_id       = true
    name                    = var.project_name
    org_id                  = var.organization_id
    billing_account         = var.billing_account
    folder_id               = var.folder_id
    default_service_account = "deprivilege"
    activate_apis           = ["compute.googleapis.com", "container.googleapis.com", "dns.googleapis.com"]
  }

  module "network" {
    source       = "terraform-google-modules/network/google"
    project_id   = module.project.project_id
    network_name = local.network_name

    subnets = [
      {
        subnet_name           = local.subnet_name
        subnet_ip             = "10.0.0.0/24"
        subnet_region         = var.region
        subnet_private_access = "true"
      },
    ]

    secondary_ranges = {
      (local.subnet_name) = [
        {
          range_name    = local.secondary_ranges_pods_name
          ip_cidr_range = "10.32.0.0/16"
        },
        {
          range_name    = local.secondary_ranges_services_name
          ip_cidr_range = "10.64.0.0/16"
        },
      ]
    }
  }

  module "gke" {
    source                            = "terraform-google-modules/kubernetes-engine/google//modules/private-cluster"
    project_id                        = module.project.project_id
    name                              = local.gke_name
    region                            = var.region
    zones                             = var.zones
    network                           = local.network_name
    subnetwork                        = local.subnet_name
    ip_range_services                 = local.secondary_ranges_services_name
    ip_range_pods                     = local.secondary_ranges_pods_name
    master_ipv4_cidr_block            = "172.16.0.0/28"
    http_load_balancing               = false
    horizontal_pod_autoscaling        = false
    network_policy                    = false
    enable_private_endpoint           = false
    enable_private_nodes              = true
    regional                          = false
    monitoring_service                = "none"
    logging_service                   = "none"
    create_service_account            = false
    remove_default_node_pool          = true
    add_master_webhook_firewall_rules = true

    node_pools = [
      {
        name               = local.node_pools_name
        machine_type       = "e2-small"
        disk_size_gb       = 30
        auto_upgrade       = false
        preemptible        = true
        initial_node_count = 1
        node_count         = 2
        node_locations     = join(",", var.zones)
        autoscaling        = false
      }
    ]

    node_pools_oauth_scopes = {
      all = [
        "https://www.googleapis.com/auth/cloud-platform",
        "https://www.googleapis.com/auth/devstorage.read_only"
      ]

      default-node-pool = []
    }

    depends_on = [
      module.network
    ]
  }

  module "cloud_router" {
    source  = "terraform-google-modules/cloud-router/google"
    project = module.project.project_id
    name    = local.cloud_router_name
    network = local.network_name
    region  = var.region
    depends_on = [
      module.network
    ]
  }

  module "cloud-nat" {
    source     = "terraform-google-modules/cloud-nat/google"
    project_id = module.project.project_id
    region     = var.region
    router     = local.cloud_router_name
    depends_on = [
      module.cloud_router
    ]
  }

  resource "google_compute_address" "ingress_ip_address" {
    name       = "nginx-controller"
    project    = module.project.project_id
    region     = var.region
    depends_on = [module.network]
  }

  module "nginx-controller" {
    source     = "terraform-iaac/nginx-controller/helm"
    ip_address = google_compute_address.ingress_ip_address.address
    atomic     = true
  }

  resource "google_service_account" "ci" {
    account_id   = var.ci_serice_account_name
    display_name = var.ci_serice_account_name
    project      = module.project.project_id
  }

  resource "google_project_iam_binding" "ci_account_container_iam" {
    role    = "roles/container.admin"
    members = ["serviceAccount:${google_service_account.ci.email}"]
    project = module.project.project_id
  }

  resource "google_project_iam_binding" "ci_account_storage_iam" {
    role    = "roles/storage.admin"
    members = ["serviceAccount:${google_service_account.ci.email}"]
    project = module.project.project_id
  }

  resource "google_project_iam_binding" "ci_account_token_iam" {
    role    = "roles/iam.serviceAccountTokenCreator"
    members = ["serviceAccount:${google_service_account.ci.email}"]
    project = module.project.project_id
  }

  resource "google_service_account_key" "ci_key" {
    service_account_id = google_service_account.ci.id
  }

  # MUST assing this permission to have ability to pull image! Otherwise 403.
  resource "google_project_iam_binding" "compute_account_storage_iam" {
    role    = "roles/storage.objectViewer"
    members = ["serviceAccount:${module.project.project_number}-compute@developer.gserviceaccount.com"]
    project = module.project.project_id
  }
}