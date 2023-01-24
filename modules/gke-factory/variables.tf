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
}

variable "cluster_zones" {
  description = "The zones of the cluster"
  type        = list(string)
}

variable "ingress_ip_address" {
  description = "The IP address of the ingress"
  type        = string
}

variable "node_pool_machine_type" {
  description = "Machine type for node pools"
  type        = string
  default     = "e2-standard-2"
}

variable "node_pool_disk_size" {
  description = "Disk size for node pools"
  type        = number
  default     = 10
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

variable "node_pool_nodes_max_count" {
  description = "Maximum number of nodes in node pools"
  type        = number
  default     = 5
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

variable "is_prometheus_metrics_enabled" {
  description = "Enable Prometheus metrics"
  type        = bool
  default     = false
}

variable "install_nginx_ingress" {
  description = "Install nginx ingress"
  type        = bool
  default     = true
}

variable "install_cert_manager" {
  description = "Install cert-manager (works only if nginx ingress is installed)"
  type        = bool
  default     = true
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

variable "nginx_controller_additional_set" {
  description = "Additional set for nginx-controller"
  type        = list(any)
  default = [
    {
      name  = "controller.resources.limits.cpu"
      value = "125m"
      type  = "string"
    },
    {
      name  = "controller.resources.limits.memory"
      value = "175Mi"
      type  = "string"
    },
    {
      name  = "controller.config.proxy-body-size",
      value = "100m"
      type  = "string"
    }
  ]
}

variable "cluster_release_channel" {
  description = "Cluster release channel (UNSPECIFIED, RAPID, REGULAR and STABLE)."
  type        = string
  default     = "STABLE"
  validation {
    condition     = length(regexall("^(UNSPECIFIED|RAPID|REGULAR|STABLE)$", var.cluster_release_channel)) > 0
    error_message = "ERROR: Valid types are \"UNSPECIFIED\", \"RAPID\", \"REGULAR\" and \"STABLE\"!"
  }
}
