variable "project_id" {
  description = "The ID of the project"
}

variable "ci_serice_account_name" {
  description = "The name of service to use for CI/CD"
}

variable "node_pools" {
  description = "Node pools"
  type        = list(map(string))
  default = [
    {
      name               = var.project_id
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
}

# GKE

variable "region" {
  description = "Cluster region"
}

variable "zones" {
  description = "Cluster zones"
}