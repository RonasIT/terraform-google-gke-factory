output "generated_user_password" {
  value       = module.postgresql.generated_user_password
  description = "The password of the defaule user to access database"
  sensitive   = true
}

output "private_ip_address" {
  value = module.postgresql.private_ip_address
  description = "The first private (PRIVATE) IPv4 address assigned for the master instance"
}