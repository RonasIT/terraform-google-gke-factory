<!-- BEGIN_TF_DOCS -->
#### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_google"></a> [google](#requirement\_google) | 4.52.0 |
| <a name="requirement_google-beta"></a> [google-beta](#requirement\_google-beta) | 4.52.0 |

#### Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 4.52.0 |

#### Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_postgresql"></a> [postgresql](#module\_postgresql) | GoogleCloudPlatform/sql-db/google//modules/postgresql | 14.0.0 |
| <a name="module_postgresql_production_private_access"></a> [postgresql\_production\_private\_access](#module\_postgresql\_production\_private\_access) | GoogleCloudPlatform/sql-db/google//modules/private_service_access | n/a |

#### Resources

| Name | Type |
|------|------|
| [google_project_service.enable_servicenetworking_api](https://registry.terraform.io/providers/hashicorp/google/4.52.0/docs/resources/project_service) | resource |

#### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_network"></a> [cluster\_network](#input\_cluster\_network) | The network of the cluster | `object({ network_name = string, network_self_link = string })` | n/a | yes |
| <a name="input_cluster_region"></a> [cluster\_region](#input\_cluster\_region) | The region of the cluster | `string` | n/a | yes |
| <a name="input_database_master_zone"></a> [database\_master\_zone](#input\_database\_master\_zone) | The zone of the master node | `string` | n/a | yes |
| <a name="input_environment_name"></a> [environment\_name](#input\_environment\_name) | The environment of the database | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The ID of the project | `string` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | The name of the project | `string` | n/a | yes |
| <a name="input_additional_databases"></a> [additional\_databases](#input\_additional\_databases) | A list of databases to be created in your cluster | <pre>list(object({<br>    name      = string<br>    charset   = string<br>    collation = string<br>  }))</pre> | `[]` | no |
| <a name="input_authorized_networks"></a> [authorized\_networks](#input\_authorized\_networks) | The authorized networks to connect to database | `list(object({ cidr_block = string, display_name = string }))` | `[]` | no |
| <a name="input_availability_type"></a> [availability\_type](#input\_availability\_type) | The availability type of database | `string` | `"REGIONAL"` | no |
| <a name="input_database_name"></a> [database\_name](#input\_database\_name) | The name of database | `string` | `"pgdb"` | no |
| <a name="input_database_user"></a> [database\_user](#input\_database\_user) | The user of database | `string` | `"pguser"` | no |
| <a name="input_database_version"></a> [database\_version](#input\_database\_version) | The version of database | `string` | `"POSTGRES_14"` | no |
| <a name="input_disk_size"></a> [disk\_size](#input\_disk\_size) | The size of disk | `number` | `10` | no |
| <a name="input_enable_private_access"></a> [enable\_private\_access](#input\_enable\_private\_access) | Whether or not to enable private access to the database | `bool` | `true` | no |

#### Outputs

| Name | Description |
|------|-------------|
| <a name="output_generated_user_password"></a> [generated\_user\_password](#output\_generated\_user\_password) | The password of the default user to access database |
| <a name="output_private_ip_address"></a> [private\_ip\_address](#output\_private\_ip\_address) | The first private (PRIVATE) IPv4 address assigned for the master instance |
<!-- END_TF_DOCS -->
