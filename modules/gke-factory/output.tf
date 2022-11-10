output "network" {
  value       = module.network
  description = "Google Virtual Private Network (VPC)"
}

output "name" {
  value       = module.gke.name
  description = "The name of the cluster"
}

output "region" {
  value       = module.gke.region
  description = "The region of the cluster"
}

output "zones" {
  value       = module.gke.zones
  description = "The zones of the cluster"
}

