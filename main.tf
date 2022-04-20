locals {
  network_name                   = "${module.project.project_name}-vpc"
  subnet_name                    = "${module.project.project_name}-${var.region}-01"
  secondary_ranges_pods_name     = "${module.project.project_name}-${var.region}-01-pods"
  secondary_ranges_services_name = "${module.project.project_name}-${var.region}-01-services"
  gke_name                       = "${module.project.project_name}-gke"
  node_pools_name                = "${module.project.project_name}-node-pool-main"
  cloud_router_name              = "${module.project.project_name}-router"
  ci_service_account_name        = "ci"
}

module "project" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 13.0.0"

  project_id              = var.project_id
  default_service_account = "deprivilege"
  activate_apis           = ["compute.googleapis.com", "container.googleapis.com"]
}

module "network" {
  source  = "terraform-google-modules/network/google"
  version = "~> 5.0.0"

  project_id   = var.project_id
  network_name = local.network_name

  subnets = [
    {
      subnet_name           = local.subnet_name
      subnet_ip             = "10.0.0.0/24"
      subnet_region         = var.cluster_region
      subnet_private_access = "true"
    }
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
      }
    ]
  }

  depends_on = [
    module.project
  ]
}

module "gke" {
  source  = "terraform-google-modules/kubernetes-engine/google//modules/private-cluster"
  version = "~> 20.0.0"

  project_id                        = var.project_id
  name                              = local.gke_name
  region                            = var.cluster_region
  zones                             = var.cluster_zones
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
  regional                          = length(var.cluster_zones) > 1 ? true : false
  create_service_account            = false
  remove_default_node_pool          = true
  add_master_webhook_firewall_rules = true

  node_pools = [
    {
      name           = local.node_pools_name
      machine_type   = var.node_pool_machine_type
      disk_size_gb   = var.node_pool_disk_size
      auto_upgrade   = var.node_pool_autoupgrade
      preemptible    = var.node_pool_preemptible
      node_locations = join(",", var.zones)
      min_count      = 1
      max_count      = var.node_pool_nodes_max_count
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
  version = "~> 1.3.0"

  project = var.project_id
  name    = local.cloud_router_name
  network = local.network_name
  region  = var.cluster_region

  depends_on = [
    module.network
  ]
}

module "cloud-nat" {
  source  = "terraform-google-modules/cloud-nat/google"
  version = "~> 2.2.0"

  project_id = var.project_id
  region     = var.cluster_region
  router     = local.cloud_router_name

  depends_on = [
    module.cloud_router
  ]
}

resource "google_compute_address" "ingress_ip_address" {
  name    = "nginx-controller"
  project = module.project.project_id
  region  = var.cluster_region

  depends_on = [
    module.network
  ]
}

module "nginx-controller" {
  source  = "terraform-iaac/nginx-controller/helm"
  version = "~> 2.0.2"

  ip_address = google_compute_address.ingress_ip_address.address
  atomic     = true
}

resource "google_service_account" "ci" {
  account_id   = local.ci_service_account_name
  display_name = local.ci_service_account_name
  project      = var.project_id
}

resource "google_project_iam_binding" "ci_account_container_iam" {
  role    = "roles/container.admin"
  members = ["serviceAccount:${google_service_account.ci.email}"]
  project = var.project_id
}

resource "google_project_iam_binding" "ci_account_storage_iam" {
  role    = "roles/storage.admin"
  members = ["serviceAccount:${google_service_account.ci.email}"]
  project = var.project_id
}

resource "google_project_iam_binding" "ci_account_token_iam" {
  role    = "roles/iam.serviceAccountTokenCreator"
  members = ["serviceAccount:${google_service_account.ci.email}"]
  project = var.project_id
}

resource "google_service_account_key" "ci_key" {
  service_account_id = google_service_account.ci.id
}

resource "google_project_iam_binding" "compute_account_storage_iam" {
  role    = "roles/storage.objectViewer"
  members = ["serviceAccount:${module.project.project_number}-compute@developer.gserviceaccount.com"]
  project = var.project_id
}