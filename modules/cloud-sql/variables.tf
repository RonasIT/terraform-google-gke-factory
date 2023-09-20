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

variable "tier" {
  description = "The tier for the master instance"
  default     = "db-f1-micro"
  type        = string
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

variable "database_version" {
  description = "The version of database"
  default     = "POSTGRES_14"
  type        = string
}

variable "disk_size" {
  description = "The size of disk"
  default     = 10
  type        = number
}

variable "availability_type" {
  description = "The availability type of database"
  default     = "REGIONAL"
  type        = string
}

variable "additional_databases" {
  description = "A list of databases to be created in your cluster"
  type = list(object({
    name      = string
    charset   = string
    collation = string
  }))
  default = []
}

variable "enable_private_access" {
  description = "Whether or not to enable private access to the database"
  default     = true
  type        = bool
}

variable "backup_configuration" {
  description = "The backup_configuration settings subblock for the database setings"
  type = object({
    enabled                        = bool
    start_time                     = string
    location                       = string
    point_in_time_recovery_enabled = bool
    transaction_log_retention_days = string
    retained_backups               = number
    retention_unit                 = string
  })
  default = {
    enabled                        = false
    start_time                     = null
    location                       = null
    point_in_time_recovery_enabled = false
    transaction_log_retention_days = null
    retained_backups               = null
    retention_unit                 = null
  }
}
