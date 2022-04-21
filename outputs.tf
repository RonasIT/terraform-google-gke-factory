output "project_id" {
  value       = var.project_id
  description = "The ID of the project"
}

output "cluster_name" {
  value       = module.gke.name
  description = "The name of the cluster"
}

output "cluster_region" {
  value       = module.gke.region
  description = "The region of the cluster"
}

output "ci_private_key" {
  value       = google_service_account_key.ci_key.private_key
  description = "The private key of the CI service account"
  sensitive   = true
}

output "ingress_ip_address" {
  value       = google_compute_address.ingress_ip_address.address
  description = "The IP address of the ingress"
}
