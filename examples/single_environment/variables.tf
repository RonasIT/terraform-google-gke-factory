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

variable "cluster_issuer_email" {
  description = "The issuer email of the cluster"
  type        = string
}
