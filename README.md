<!-- BEGIN_TF_DOCS -->
#### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform) | >= 1.1 |
| <a name="requirement_google"></a> [google](#requirement_google) | ~> 4.5 |
| <a name="requirement_helm"></a> [helm](#requirement_helm) | ~> 2.3 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement_kubernetes) | ~> 2.4 |
| <a name="requirement_null"></a> [null](#requirement_null) | ~> 2.1 |
| <a name="requirement_random"></a> [random](#requirement_random) | ~> 2.2 |

#### Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider_google) | ~> 4.5 |

#### Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cloud-nat"></a> [cloud-nat](#module_cloud-nat) | terraform-google-modules/cloud-nat/google | n/a |
| <a name="module_cloud_router"></a> [cloud_router](#module_cloud_router) | terraform-google-modules/cloud-router/google | n/a |
| <a name="module_gke"></a> [gke](#module_gke) | terraform-google-modules/kubernetes-engine/google//modules/private-cluster | n/a |
| <a name="module_network"></a> [network](#module_network) | terraform-google-modules/network/google | n/a |
| <a name="module_nginx-controller"></a> [nginx-controller](#module_nginx-controller) | terraform-iaac/nginx-controller/helm | n/a |
| <a name="module_project"></a> [project](#module_project) | terraform-google-modules/project-factory/google | n/a |

#### Resources

| Name | Type |
|------|------|
| [google_compute_address.ingress_ip_address](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_address) | resource |
| [google_project_iam_binding.ci_account_container_iam](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_binding) | resource |
| [google_project_iam_binding.ci_account_storage_iam](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_binding) | resource |
| [google_project_iam_binding.ci_account_token_iam](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_binding) | resource |
| [google_project_iam_binding.compute_account_storage_iam](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_binding) | resource |
| [google_service_account.ci](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account) | resource |
| [google_service_account_key.ci_key](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account_key) | resource |

#### Inputs

| Name | Description | Type |
|------|-------------|------|
| <a name="input_billing_account"></a> [billing_account](#input_billing_account) | The ID of the billing account to associate this project with | `any` |
| <a name="input_ci_serice_account_name"></a> [ci_serice_account_name](#input_ci_serice_account_name) | The name of service to use for CI/CD | `any` |
| <a name="input_folder_id"></a> [folder_id](#input_folder_id) | The ID of the folder to host this project | `any` |
| <a name="input_organization_id"></a> [organization_id](#input_organization_id) | The organization id for the associated services | `any` |
| <a name="input_project_name"></a> [project_name](#input_project_name) | The name of the project | `any` |
| <a name="input_region"></a> [region](#input_region) | Cluster region | `any` |
| <a name="input_zones"></a> [zones](#input_zones) | Cluster zones | `any` |

#### Outputs

| Name | Description |
|------|-------------|
| <a name="output_ci_private_key"></a> [ci_private_key](#output_ci_private_key) | n/a |
| <a name="output_cluster_name"></a> [cluster_name](#output_cluster_name) | n/a |
| <a name="output_project_id"></a> [project_id](#output_project_id) | n/a |
<!-- END_TF_DOCS -->