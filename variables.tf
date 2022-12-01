variable "project_id" {
  description = "The ID of the project"
  type        = string
}

variable "project_name" {
  description = "The name of the project"
  type        = string
}

variable "cluster_region" {
  description = "The region of the cluster"
  type        = string
  default     = "us-central1"
}

variable "cluster_zones" {
  description = "The zones of the cluster"
  type        = list(string)
  default     = ["us-central1-a"]
}

variable "node_pool_machine_type" {
  description = "Machine type for node pools"
  type        = string
  default     = "n1-standard-1"
}

variable "node_pool_disk_size" {
  description = "Disk size for node pools"
  type        = number
  default     = 30
}

variable "node_pool_disk_type" {
  description = "Disk type for node pools"
  type        = string
  default     = "pd-balanced"
}

variable "node_pool_autoupgrade" {
  description = "Autoupgrade for node pools"
  type        = bool
  default     = true
}

variable "node_pool_preemptible" {
  description = "Preemptible for node pools"
  type        = bool
  default     = false
}

variable "node_pool_nodes_max_count" {
  description = "Maximum number of nodes in node pools"
  type        = number
  default     = 3
}

variable "cluster_issuer_email" {
  description = "The email of the cluster issuer"
  type        = string
}

variable "cluster_issuer_server" {
  description = "The server of the cluster issuer"
  type        = string
  default     = "https://acme-v02.api.letsencrypt.org/directory"
}

variable "logging_service" {
  description = "The logging service"
  type        = string
  default     = "none"
}

variable "monitoring_service" {
  description = "The monitoring service"
  type        = string
  default     = "none"
}

variable "is_prometheus_metrics_enabled" {
  description = "Enable Prometheus metrics"
  type        = bool
  default     = false
}

variable "cert_manager_additional_solvers" {
  description = "Additional solvers for cert-manager"
  type        = list(any)
  default     = []
}

variable "nginx_controller_additional_set" {
  description = "Additional set for nginx-controller"
  type        = list(any)
  default     = []
}

variable "cluster_release_channel" {
  description = "Cluster release channel (UNSPECIFIED, RAPID, REGULAR and STABLE). Defaults to UNSPECIFIED."
  type        = string
  default     = "UNSPECIFIED"
}

variable "environment_name" {
  description = "The name of the environment"
  type        = string
  default     = "cloud"
  validation {
    condition     = length(regexall("^(development|production|staging|cloud)$", var.environment_name)) > 0
    error_message = "ERROR: Valid types are \"development\", \"production\", \"staging\", and \"cloud\"!"
  }
}