output "project_id" {
  value = module.project.project_id
}

output "cluster_name" {
  value = module.gke.name
}

output "ci_private_key" {
  value     = google_service_account_key.ci_key.private_key
  sensitive = true
}

output "ingress_ip_address" {
  value = google_compute_address.ingress_ip_address.address
}
