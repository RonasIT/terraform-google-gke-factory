<!-- BEGIN_TF_DOCS -->
#### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_google"></a> [google](#requirement\_google) | 4.52.0 |
| <a name="requirement_google-beta"></a> [google-beta](#requirement\_google-beta) | 4.52.0 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | 2.7.1 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | 2.15.0 |

#### Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 4.52.0 |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | 2.15.0 |

#### Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cert_manager"></a> [cert\_manager](#module\_cert\_manager) | terraform-iaac/cert-manager/kubernetes | 2.5.0 |
| <a name="module_cloud_nat"></a> [cloud\_nat](#module\_cloud\_nat) | terraform-google-modules/cloud-nat/google | ~> 2.2.2 |
| <a name="module_cloud_router"></a> [cloud\_router](#module\_cloud\_router) | terraform-google-modules/cloud-router/google | ~> 4.0.0 |
| <a name="module_gke"></a> [gke](#module\_gke) | terraform-google-modules/kubernetes-engine/google//modules/private-cluster | ~> 25.0.0 |
| <a name="module_network"></a> [network](#module\_network) | terraform-google-modules/network/google | ~> 6.0.1 |
| <a name="module_nginx-controller"></a> [nginx-controller](#module\_nginx-controller) | terraform-iaac/nginx-controller/helm | 2.1.0 |

#### Resources

| Name | Type |
|------|------|
| [google_project_service.enable_cloud_resource_manager_api](https://registry.terraform.io/providers/hashicorp/google/4.52.0/docs/resources/project_service) | resource |
| [google_project_service.enable_compute_api](https://registry.terraform.io/providers/hashicorp/google/4.52.0/docs/resources/project_service) | resource |
| [google_project_service.enable_container_api](https://registry.terraform.io/providers/hashicorp/google/4.52.0/docs/resources/project_service) | resource |
| [kubernetes_namespace.nginx_controller_namespace](https://registry.terraform.io/providers/hashicorp/kubernetes/2.15.0/docs/resources/namespace) | resource |
| [google_client_config.default](https://registry.terraform.io/providers/hashicorp/google/4.52.0/docs/data-sources/client_config) | data source |

#### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_issuer_email"></a> [cluster\_issuer\_email](#input\_cluster\_issuer\_email) | The email of the cluster issuer | `string` | n/a | yes |
| <a name="input_cluster_region"></a> [cluster\_region](#input\_cluster\_region) | The region of the cluster | `string` | n/a | yes |
| <a name="input_cluster_zones"></a> [cluster\_zones](#input\_cluster\_zones) | The zones of the cluster | `list(string)` | n/a | yes |
| <a name="input_ingress_ip_address"></a> [ingress\_ip\_address](#input\_ingress\_ip\_address) | The IP address of the ingress | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The ID of the project | `string` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | The name of the project | `string` | n/a | yes |
| <a name="input_cluster_issuer_server"></a> [cluster\_issuer\_server](#input\_cluster\_issuer\_server) | The server of the cluster issuer | `string` | `"https://acme-v02.api.letsencrypt.org/directory"` | no |
| <a name="input_cluster_release_channel"></a> [cluster\_release\_channel](#input\_cluster\_release\_channel) | Cluster release channel (UNSPECIFIED, RAPID, REGULAR and STABLE). | `string` | `"STABLE"` | no |
| <a name="input_environment_name"></a> [environment\_name](#input\_environment\_name) | The name of the environment | `string` | `"cloud"` | no |
| <a name="input_install_nginx_ingress_and_cert_manager"></a> [install\_nginx\_ingress\_and\_cert\_manager](#input\_install\_nginx\_ingress\_and\_cert\_manager) | Install nginx ingress and cert manager | `bool` | `true` | no |
| <a name="input_is_prometheus_metrics_enabled"></a> [is\_prometheus\_metrics\_enabled](#input\_is\_prometheus\_metrics\_enabled) | Enable Prometheus metrics | `bool` | `false` | no |
| <a name="input_nginx_controller_additional_set"></a> [nginx\_controller\_additional\_set](#input\_nginx\_controller\_additional\_set) | Additional set for nginx-controller | `list(any)` | <pre>[<br>  {<br>    "name": "controller.resources.limits.cpu",<br>    "type": "string",<br>    "value": "125m"<br>  },<br>  {<br>    "name": "controller.resources.limits.memory",<br>    "type": "string",<br>    "value": "175Mi"<br>  },<br>  {<br>    "name": "controller.config.proxy-body-size",<br>    "type": "string",<br>    "value": "100m"<br>  }<br>]</pre> | no |
| <a name="input_node_pool_autoupgrade"></a> [node\_pool\_autoupgrade](#input\_node\_pool\_autoupgrade) | Autoupgrade for node pools | `bool` | `true` | no |
| <a name="input_node_pool_disk_size"></a> [node\_pool\_disk\_size](#input\_node\_pool\_disk\_size) | Disk size for node pools | `number` | `10` | no |
| <a name="input_node_pool_disk_type"></a> [node\_pool\_disk\_type](#input\_node\_pool\_disk\_type) | Disk type for node pools | `string` | `"pd-balanced"` | no |
| <a name="input_node_pool_machine_type"></a> [node\_pool\_machine\_type](#input\_node\_pool\_machine\_type) | Machine type for node pools | `string` | `"e2-standard-2"` | no |
| <a name="input_node_pool_nodes_max_count"></a> [node\_pool\_nodes\_max\_count](#input\_node\_pool\_nodes\_max\_count) | Maximum number of nodes in node pools | `number` | `5` | no |

#### Outputs

| Name | Description |
|------|-------------|
| <a name="output_name"></a> [name](#output\_name) | The name of the cluster |
| <a name="output_network"></a> [network](#output\_network) | Google Virtual Private Network (VPC) |
| <a name="output_region"></a> [region](#output\_region) | The region of the cluster |
| <a name="output_zones"></a> [zones](#output\_zones) | The zones of the cluster |
<!-- END_TF_DOCS -->