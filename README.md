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
| <a name="requirement_google"></a> [google](#requirement\_google) | 4.31.0 |
| <a name="requirement_kubectl"></a> [kubectl](#requirement\_kubectl) | 1.14.0 |

#### Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 4.31.0 |

#### Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_gke"></a> [gke](#module\_gke) | ./modules/gke-factory | n/a |

#### Resources

| Name | Type |
|------|------|
| [google_compute_address.ingress_ip_address](https://registry.terraform.io/providers/hashicorp/google/4.31.0/docs/resources/compute_address) | resource |
| [google_project_iam_binding.compute_account_storage_iam](https://registry.terraform.io/providers/hashicorp/google/4.31.0/docs/resources/project_iam_binding) | resource |
| [google_project_iam_member.ci_service_account_editor_iam](https://registry.terraform.io/providers/hashicorp/google/4.31.0/docs/resources/project_iam_member) | resource |
| [google_project_iam_member.ci_service_account_token_creator_iam](https://registry.terraform.io/providers/hashicorp/google/4.31.0/docs/resources/project_iam_member) | resource |
| [google_service_account.ci_service_account](https://registry.terraform.io/providers/hashicorp/google/4.31.0/docs/resources/service_account) | resource |
| [google_service_account_key.ci_service_account_key](https://registry.terraform.io/providers/hashicorp/google/4.31.0/docs/resources/service_account_key) | resource |
| [google_client_config.default](https://registry.terraform.io/providers/hashicorp/google/4.31.0/docs/data-sources/client_config) | data source |
| [google_project.project](https://registry.terraform.io/providers/hashicorp/google/4.31.0/docs/data-sources/project) | data source |

#### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_issuer_email"></a> [cluster\_issuer\_email](#input\_cluster\_issuer\_email) | The email of the cluster issuer | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The ID of the project | `string` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | The name of the project | `string` | n/a | yes |
| <a name="input_cert_manager_additional_solvers"></a> [cert\_manager\_additional\_solvers](#input\_cert\_manager\_additional\_solvers) | Additional solvers for cert-manager | `list(any)` | `[]` | no |
| <a name="input_cluster_issuer_server"></a> [cluster\_issuer\_server](#input\_cluster\_issuer\_server) | The server of the cluster issuer | `string` | `"https://acme-v02.api.letsencrypt.org/directory"` | no |
| <a name="input_cluster_region"></a> [cluster\_region](#input\_cluster\_region) | The region of the cluster | `string` | `"us-central1"` | no |
| <a name="input_cluster_release_channel"></a> [cluster\_release\_channel](#input\_cluster\_release\_channel) | Cluster release channel (UNSPECIFIED, RAPID, REGULAR and STABLE). Defaults to UNSPECIFIED. | `string` | `"UNSPECIFIED"` | no |
| <a name="input_cluster_zones"></a> [cluster\_zones](#input\_cluster\_zones) | The zones of the cluster | `list(string)` | <pre>[<br>  "us-central1-a"<br>]</pre> | no |
| <a name="input_is_prometheus_metrics_enabled"></a> [is\_prometheus\_metrics\_enabled](#input\_is\_prometheus\_metrics\_enabled) | Enable Prometheus metrics | `bool` | `false` | no |
| <a name="input_logging_service"></a> [logging\_service](#input\_logging\_service) | The logging service | `string` | `"none"` | no |
| <a name="input_monitoring_service"></a> [monitoring\_service](#input\_monitoring\_service) | The monitoring service | `string` | `"none"` | no |
| <a name="input_nginx_controller_additional_set"></a> [nginx\_controller\_additional\_set](#input\_nginx\_controller\_additional\_set) | Additional set for nginx-controller | `list(any)` | `[]` | no |
| <a name="input_node_pool_autoupgrade"></a> [node\_pool\_autoupgrade](#input\_node\_pool\_autoupgrade) | Autoupgrade for node pools | `bool` | `true` | no |
| <a name="input_node_pool_disk_size"></a> [node\_pool\_disk\_size](#input\_node\_pool\_disk\_size) | Disk size for node pools | `number` | `30` | no |
| <a name="input_node_pool_disk_type"></a> [node\_pool\_disk\_type](#input\_node\_pool\_disk\_type) | Disk type for node pools | `string` | `"pd-balanced"` | no |
| <a name="input_node_pool_machine_type"></a> [node\_pool\_machine\_type](#input\_node\_pool\_machine\_type) | Machine type for node pools | `string` | `"n1-standard-1"` | no |
| <a name="input_node_pool_nodes_max_count"></a> [node\_pool\_nodes\_max\_count](#input\_node\_pool\_nodes\_max\_count) | Maximum number of nodes in node pools | `number` | `3` | no |
| <a name="input_node_pool_preemptible"></a> [node\_pool\_preemptible](#input\_node\_pool\_preemptible) | Preemptible for node pools | `bool` | `false` | no |

#### Outputs

| Name | Description |
|------|-------------|
| <a name="output_ci_email"></a> [ci\_email](#output\_ci\_email) | The email of the CI service account |
| <a name="output_ci_private_key"></a> [ci\_private\_key](#output\_ci\_private\_key) | The private key of the CI service account |
| <a name="output_cluster_name"></a> [cluster\_name](#output\_cluster\_name) | The name of the cluster |
| <a name="output_cluster_network"></a> [cluster\_network](#output\_cluster\_network) | Network of the cluster |
| <a name="output_cluster_region"></a> [cluster\_region](#output\_cluster\_region) | The region of the cluster |
| <a name="output_cluster_zones"></a> [cluster\_zones](#output\_cluster\_zones) | The zones of the cluster |
| <a name="output_ingress_ip_address"></a> [ingress\_ip\_address](#output\_ingress\_ip\_address) | The IP address of the ingress |
| <a name="output_project_id"></a> [project\_id](#output\_project\_id) | The ID of the project |
| <a name="output_project_name"></a> [project\_name](#output\_project\_name) | The name of the project |
<!-- END_TF_DOCS -->