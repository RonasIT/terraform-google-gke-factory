output "ingress_ip_address_developemnt" {
  value       = google_compute_address.ingress_ip_address_development.address
  description = "The IP address of the developemnt ingress controller"
}

output "ingress_ip_address_production" {
  value       = google_compute_address.ingress_ip_address_production.address
  description = "The IP address of the production ingress controller"
}

output "database_production_generated_user_password" {
  value       = module.postgresql_production.generated_user_password
  description = "The password of the defaule user to access database"
  sensitive   = true
}

output "database_production_private_ip_address" {
  value       = module.postgresql_production.private_ip_address
  description = "The first private (PRIVATE) IPv4 address assigned for the master instance"
}
