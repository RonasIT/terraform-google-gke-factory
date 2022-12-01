# Multi environment example (development (zonal), production(regional) + cloudsql production DB)

<!-- BEGIN_TF_DOCS -->
#### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_google"></a> [google](#requirement\_google) | 4.35.0 |

#### Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 4.35.0 |

#### Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_gke_development"></a> [gke\_development](#module\_gke\_development) | RonasIT/gke-factory/google//modules/gke-factory | ~> 3.0.0 |
| <a name="module_gke_production"></a> [gke\_production](#module\_gke\_production) | RonasIT/gke-factory/google//modules/gke-factory | ~> 3.0.0 |
| <a name="module_postgresql_production"></a> [postgresql\_production](#module\_postgresql\_production) | RonasIT/gke-factory/google//modules/cloud-sql | ~> 3.0.0 |

#### Resources

| Name | Type |
|------|------|
| [google_compute_address.ingress_ip_address_development](https://registry.terraform.io/providers/hashicorp/google/4.35.0/docs/resources/compute_address) | resource |
| [google_compute_address.ingress_ip_address_production](https://registry.terraform.io/providers/hashicorp/google/4.35.0/docs/resources/compute_address) | resource |
| [google_storage_bucket.artifacts_bucket_development](https://registry.terraform.io/providers/hashicorp/google/4.35.0/docs/resources/storage_bucket) | resource |
| [google_storage_bucket.artifacts_bucket_production](https://registry.terraform.io/providers/hashicorp/google/4.35.0/docs/resources/storage_bucket) | resource |
| [google_project.project](https://registry.terraform.io/providers/hashicorp/google/4.35.0/docs/data-sources/project) | data source |

#### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_issuer_email"></a> [cluster\_issuer\_email](#input\_cluster\_issuer\_email) | The issuer email of the cluster | `string` | n/a | yes |
| <a name="input_cluster_region_development"></a> [cluster\_region\_development](#input\_cluster\_region\_development) | The region of the development cluster | `string` | n/a | yes |
| <a name="input_cluster_region_production"></a> [cluster\_region\_production](#input\_cluster\_region\_production) | The region of the production cluster | `string` | n/a | yes |
| <a name="input_cluster_zones_development"></a> [cluster\_zones\_development](#input\_cluster\_zones\_development) | The zones of the development cluster | `list(string)` | n/a | yes |
| <a name="input_cluster_zones_production"></a> [cluster\_zones\_production](#input\_cluster\_zones\_production) | The zones of the production cluster | `list(string)` | n/a | yes |
| <a name="input_database_master_zone_production"></a> [database\_master\_zone\_production](#input\_database\_master\_zone\_production) | The zone for the master instance of production database | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The ID of the project | `string` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | The name of the project | `string` | n/a | yes |

#### Outputs

| Name | Description |
|------|-------------|
| <a name="output_database_production_generated_user_password"></a> [database\_production\_generated\_user\_password](#output\_database\_production\_generated\_user\_password) | The password of the defaule user to access database |
| <a name="output_database_production_private_ip_address"></a> [database\_production\_private\_ip\_address](#output\_database\_production\_private\_ip\_address) | The first private (PRIVATE) IPv4 address assigned for the master instance |
| <a name="output_ingress_ip_address_developemnt"></a> [ingress\_ip\_address\_developemnt](#output\_ingress\_ip\_address\_developemnt) | The IP address of the developemnt ingress controller |
| <a name="output_ingress_ip_address_production"></a> [ingress\_ip\_address\_production](#output\_ingress\_ip\_address\_production) | The IP address of the production ingress controller |
<!-- END_TF_DOCS -->