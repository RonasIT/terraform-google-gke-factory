output "project_id" {
  value       = var.project_id
  description = "The ID of the project"
}

output "project_name" {
  value       = var.project_name
  description = "The name of the project"
}

output "cluster_name" {
  value       = module.gke.name
  description = "The name of the cluster"
}

output "cluster_region" {
  value       = module.gke.region
  description = "The region of the cluster"
}

output "cluster_zones" {
  value       = module.gke.zones
  description = "The zones of the cluster"
}

output "cluster_network" {
  value       = module.gke.network
  description = "Network of the cluster"
}

output "service_account_ci_email" {
  value       = google_service_account.ci_service_account.email
  description = "The email of the CI service account"
}

output "service_account_ci_private_key" {
  value       = google_service_account_key.ci_service_account_key.private_key
  description = "The private key of the CI service account"
  sensitive   = true
}

output "service_account_storage_email" {
  value       = google_service_account.storage_service_account.email
  description = "The email of the storage service account"
}

output "service_account_storage_private_key" {
  value       = google_service_account_key.storage_service_account_key.private_key
  description = "The private key of the storage service account"
  sensitive   = true
}

output "ingress_ip_address" {
  value       = google_compute_address.ingress_ip_address.address
  description = "The IP address of the ingress"
}

output "artifacts_bucket_url" {
  value       = google_storage_bucket.artifacts_bucket.url
  description = "The URL of the artifacts bucket"
}
