variable "project_id" {
  description = "The ID of the project"
  type        = string
}

variable "project_name" {
  description = "The name of the project"
  type        = string
}

variable "cluster_region_development" {
  description = "The region of the development cluster"
  type        = string
}

variable "cluster_zones_development" {
  description = "The zones of the development cluster"
  type        = list(string)
}

variable "cluster_region_production" {
  description = "The region of the production cluster"
  type        = string
}

variable "cluster_zones_production" {
  description = "The zones of the production cluster"
  type        = list(string)
}

variable "database_master_zone_production" {
  description = "The zone for the master instance of production database"
  type        = string
}

variable "cluster_issuer_email" {
  description = "The issuer email of the cluster"
  type        = string
}
