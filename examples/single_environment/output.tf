output "service_account_ci_private_key" {
  value       = module.gke.service_account_ci_private_key
  description = "The private key of the CI service account"
  sensitive   = true
}

output "service_account_storage_private_key" {
  value       = module.gke.service_account_storage_private_key
  description = "The private key of the storage service account"
  sensitive   = true
}

output "ingress_ip_address" {
  value       = module.gke.ingress_ip_address
  description = "The IP address of the ingress"
}

output "artifacts_bucket_url" {
  value       = module.gke.artifacts_bucket_url
  description = "The URL of the artifacts bucket"
}