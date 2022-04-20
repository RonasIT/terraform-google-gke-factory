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
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform) | >= 1.1 |
| <a name="requirement_google"></a> [google](#requirement_google) | ~> 4.5 |

#### Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider_google) | ~> 4.5 |

#### Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cert_manager"></a> [cert_manager](#module_cert_manager) | terraform-iaac/cert-manager/kubernetes | ~> 2.4.2 |
| <a name="module_cloud-nat"></a> [cloud-nat](#module_cloud-nat) | terraform-google-modules/cloud-nat/google | ~> 2.2.0 |
| <a name="module_cloud_router"></a> [cloud_router](#module_cloud_router) | terraform-google-modules/cloud-router/google | ~> 1.3.0 |
| <a name="module_gke"></a> [gke](#module_gke) | terraform-google-modules/kubernetes-engine/google//modules/private-cluster | ~> 20.0.0 |
| <a name="module_network"></a> [network](#module_network) | terraform-google-modules/network/google | ~> 5.0.0 |
| <a name="module_nginx-controller"></a> [nginx-controller](#module_nginx-controller) | terraform-iaac/nginx-controller/helm | ~> 2.0.2 |

#### Resources

| Name | Type |
|------|------|
| [google_compute_address.ingress_ip_address](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_address) | resource |
| [google_project_default_service_accounts.deprivilege_default_service_account](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_default_service_accounts) | resource |
| [google_project_iam_binding.ci_account_container_iam](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_binding) | resource |
| [google_project_iam_binding.ci_account_storage_iam](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_binding) | resource |
| [google_project_iam_binding.ci_account_token_iam](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_binding) | resource |
| [google_project_iam_binding.compute_account_storage_iam](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_binding) | resource |
| [google_project_service.enable_compute_api](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_service) | resource |
| [google_project_service.enable_container_api](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_service) | resource |
| [google_service_account.ci](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account) | resource |
| [google_service_account_key.ci_key](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account_key) | resource |
| [google_client_config.default](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/client_config) | data source |
| [google_project.project](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/project) | data source |

#### Inputs

| Name | Description | Type |
|------|-------------|------|
| <a name="input_project_id"></a> [project_id](#input_project_id) | The ID of the project | `string` |
| <a name="input_cluster_issuer_email"></a> [cluster_issuer_email](#input_cluster_issuer_email) | The email of the cluster issuer | `string` |
| <a name="input_cluster_region"></a> [cluster_region](#input_cluster_region) | The region of the cluster | `string` |
| <a name="input_cluster_zones"></a> [cluster_zones](#input_cluster_zones) | The zones of the cluster | `list(string)` |
| <a name="input_node_pool_autoupgrade"></a> [node_pool_autoupgrade](#input_node_pool_autoupgrade) | Autoupgrade for node pools | `bool` |
| <a name="input_node_pool_disk_size"></a> [node_pool_disk_size](#input_node_pool_disk_size) | Disk size for node pools | `number` |
| <a name="input_node_pool_machine_type"></a> [node_pool_machine_type](#input_node_pool_machine_type) | Machine type for node pools | `string` |
| <a name="input_node_pool_nodes_max_count"></a> [node_pool_nodes_max_count](#input_node_pool_nodes_max_count) | Maximum number of nodes in node pools | `number` |
| <a name="input_node_pool_preemptible"></a> [node_pool_preemptible](#input_node_pool_preemptible) | Preemptible for node pools | `bool` |

#### Outputs

| Name | Description |
|------|-------------|
| <a name="output_ci_private_key"></a> [ci_private_key](#output_ci_private_key) | The private key of the CI service account |
| <a name="output_cluster_name"></a> [cluster_name](#output_cluster_name) | The name of the cluster |
| <a name="output_ingress_ip_address"></a> [ingress_ip_address](#output_ingress_ip_address) | The IP address of the ingress |
| <a name="output_project_id"></a> [project_id](#output_project_id) | The ID of the project |
<!-- END_TF_DOCS -->