# Singel environmnet example (zonal cluser)

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
| <a name="module_gke"></a> [gke](#module\_gke) | RonasIT/gke-factory/google | ~> 3.0.0 |

#### Resources

| Name | Type |
|------|------|
| [google_project.project](https://registry.terraform.io/providers/hashicorp/google/4.35.0/docs/data-sources/project) | data source |

#### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_issuer_email"></a> [cluster\_issuer\_email](#input\_cluster\_issuer\_email) | The issuer email of the cluster | `string` | n/a | yes |
| <a name="input_cluster_region"></a> [cluster\_region](#input\_cluster\_region) | The region of the cluster | `string` | n/a | yes |
| <a name="input_cluster_zones"></a> [cluster\_zones](#input\_cluster\_zones) | The zones of the cluster | `list(string)` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The ID of the project | `string` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | The name of the project | `string` | n/a | yes |

#### Outputs

| Name | Description |
|------|-------------|
| <a name="output_artifacts_bucket_url"></a> [artifacts\_bucket\_url](#output\_artifacts\_bucket\_url) | The URL of the artifacts bucket |
| <a name="output_ingress_ip_address"></a> [ingress\_ip\_address](#output\_ingress\_ip\_address) | The IP address of the ingress |
| <a name="output_service_account_ci_private_key"></a> [service\_account\_ci\_private\_key](#output\_service\_account\_ci\_private\_key) | The private key of the CI service account |
| <a name="output_service_account_storage_private_key"></a> [service\_account\_storage\_private\_key](#output\_service\_account\_storage\_private\_key) | The private key of the storage service account |
<!-- END_TF_DOCS -->