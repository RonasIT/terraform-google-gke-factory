variable "project_id" {
  description = "The ID of the project"
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

variable "node_pool_autoupgrade" {
  description = "Autoupgrade for node pools"
  type        = bool
  default     = false
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

variable "cluster_max_cpu_cores" {
  description = "Maximum number of CPU cores"
  type        = number
  default     = 2
}

variable "cluster_max_memory_gb" {
  description = "Maximum memory in GB"
  type        = number
  default     = 4
}

variable "cluster_min_cpu_cores" {
  description = "Minimum number of CPU cores"
  type        = number
  default     = 1
}

variable "cluster_min_memory_gb" {
  description = "Minimum memory in GB"
  type        = number
  default     = 1
}