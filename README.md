# Ronas IT GCP Project Factory

## Setup

```sh
terraform init
```

```sh
gcloud auth application-default login
```

```sh
terraform state pull
```

## Required roles in GCP

* Editor

## Get GKE service account key

```sh
terraform output ci_private_key
```

## Update doc

```sh
terraform-docs -c .tfdocs-config.yml .
```

## Module documentation

<!-- BEGIN_TF_DOCS -->
#### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.1 |
| <a name="requirement_google"></a> [google](#requirement\_google) | ~> 4.5 |
| <a name="requirement_kubectl"></a> [kubectl](#requirement\_kubectl) | 1.14.0 |

#### Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | ~> 4.5 |

#### Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cert_manager"></a> [cert\_manager](#module\_cert\_manager) | terraform-iaac/cert-manager/kubernetes | ~> 2.4.2 |
| <a name="module_cloud_nat"></a> [cloud\_nat](#module\_cloud\_nat) | terraform-google-modules/cloud-nat/google | ~> 2.2.0 |
| <a name="module_cloud_router"></a> [cloud\_router](#module\_cloud\_router) | terraform-google-modules/cloud-router/google | ~> 1.3.0 |
| <a name="module_gke"></a> [gke](#module\_gke) | terraform-google-modules/kubernetes-engine/google//modules/private-cluster | ~> 20.0.0 |
| <a name="module_network"></a> [network](#module\_network) | terraform-google-modules/network/google | ~> 5.0.0 |
| <a name="module_nginx-controller"></a> [nginx-controller](#module\_nginx-controller) | terraform-iaac/nginx-controller/helm | ~> 2.0.2 |

#### Resources

| Name | Type |
|------|------|
| [google_compute_address.ingress_ip_address](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_address) | resource |
| [google_project_default_service_accounts.deprivilege_default_service_account](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_default_service_accounts) | resource |
| [google_project_iam_binding.compute_account_storage_iam](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_binding) | resource |
| [google_project_iam_member.ci_service_account_editor_iam](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_project_iam_member.ci_service_account_token_creator_iam](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_project_service.enable_cloud_resource_manager_api](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_service) | resource |
| [google_project_service.enable_compute_api](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_service) | resource |
| [google_project_service.enable_container_api](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_service) | resource |
| [google_service_account.ci_service_account](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account) | resource |
| [google_service_account_key.ci_service_account_key](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account_key) | resource |
| [google_client_config.default](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/client_config) | data source |
| [google_project.project](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/project) | data source |

#### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_issuer_email"></a> [cluster\_issuer\_email](#input\_cluster\_issuer\_email) | The email of the cluster issuer | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The ID of the project | `string` | n/a | yes |
| <a name="input_cluster_region"></a> [cluster\_region](#input\_cluster\_region) | The region of the cluster | `string` | `"us-central1"` | no |
| <a name="input_cluster_zones"></a> [cluster\_zones](#input\_cluster\_zones) | The zones of the cluster | `list(string)` | <pre>[<br>  "us-central1-a"<br>]</pre> | no |
| <a name="input_logging_service"></a> [logging\_service](#input\_logging\_service) | The logging service | `string` | `""` | no |
| <a name="input_monitoring_service"></a> [monitoring\_service](#input\_monitoring\_service) | The monitoring service | `string` | `""` | no |
| <a name="input_node_pool_autoupgrade"></a> [node\_pool\_autoupgrade](#input\_node\_pool\_autoupgrade) | Autoupgrade for node pools | `bool` | `true` | no |
| <a name="input_node_pool_disk_size"></a> [node\_pool\_disk\_size](#input\_node\_pool\_disk\_size) | Disk size for node pools | `number` | `30` | no |
| <a name="input_node_pool_machine_type"></a> [node\_pool\_machine\_type](#input\_node\_pool\_machine\_type) | Machine type for node pools | `string` | `"n1-standard-1"` | no |
| <a name="input_node_pool_nodes_max_count"></a> [node\_pool\_nodes\_max\_count](#input\_node\_pool\_nodes\_max\_count) | Maximum number of nodes in node pools | `number` | `3` | no |
| <a name="input_node_pool_preemptible"></a> [node\_pool\_preemptible](#input\_node\_pool\_preemptible) | Preemptible for node pools | `bool` | `false` | no |

#### Outputs

| Name | Description |
|------|-------------|
| <a name="output_ci_email"></a> [ci\_email](#output\_ci\_email) | The email of the CI service account |
| <a name="output_ci_private_key"></a> [ci\_private\_key](#output\_ci\_private\_key) | The private key of the CI service account |
| <a name="output_cluster_name"></a> [cluster\_name](#output\_cluster\_name) | The name of the cluster |
| <a name="output_cluster_region"></a> [cluster\_region](#output\_cluster\_region) | The region of the cluster |
| <a name="output_cluster_zones"></a> [cluster\_zones](#output\_cluster\_zones) | The zones of the cluster |
| <a name="output_ingress_ip_address"></a> [ingress\_ip\_address](#output\_ingress\_ip\_address) | The IP address of the ingress |
| <a name="output_project_id"></a> [project\_id](#output\_project\_id) | The ID of the project |
<!-- END_TF_DOCS -->