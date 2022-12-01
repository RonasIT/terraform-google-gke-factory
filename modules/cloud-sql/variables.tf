variable "project_id" {
  description = "The ID of the project"
  type        = string
}

variable "project_name" {
  description = "The name of the project"
  type        = string
}

variable "environment_name" {
  description = "The environment of the database"
  type        = string
}

variable "cluster_region" {
  description = "The region of the cluster"
  type        = string
}

variable "cluster_network" {
  description = "The network of the cluster"
  type        = object({ network_name = string, network_self_link = string })
}

variable "database_master_zone" {
  description = "The zone of the master node"
  type        = string
}

variable "database_name" {
  description = "The name of database"
  default     = "pgdb"
  type        = string
}

variable "database_user" {
  description = "The user of database"
  default     = "pguser"
  type        = string
}

variable "authorized_networks" {
  description = "The authorized networks to connect to database"
  default     = []
  type        = list(object({ cidr_block = string, display_name = string }))
}
