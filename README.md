# Google Service Networking Connection

Private services access is a private connection between your VPC network and a network owned by Google or a third
party. Google or the third party, entities who are offering services, are also known as service producers.

The private connection enables VM instances in your VPC network and the services that you access to communicate
exclusively by using internal IP addresses. VM instances don't need internet access or external IP addresses to
reach services that are available through private services access.

https://cloud.google.com/vpc/docs/configure-private-services-access

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 3.52 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 4.29.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_compute_global_address.private_service_connection](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_global_address) | resource |
| [google_service_networking_connection.private_service_connection](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_networking_connection) | resource |
| [google_compute_network.network](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/compute_network) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_network"></a> [network](#input\_network) | Name or URI of VPC network connected with service producers using VPC peering. | `string` | n/a | yes |
| <a name="input_peering_ranges"></a> [peering\_ranges](#input\_peering\_ranges) | A list of IP address ranges to reserve for the service connection. | `list(string)` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The Google Cloud Platform project ID | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_network"></a> [network](#output\_network) | Name of VPC network connected with service producers using VPC peering. |
| <a name="output_peering"></a> [peering](#output\_peering) | The name of the VPC Network Peering connection that was created by the service producer. |
| <a name="output_reserved_peering_ranges"></a> [reserved\_peering\_ranges](#output\_reserved\_peering\_ranges) | Named IP address range(s) of PEERING type reserved for this service provider. |
| <a name="output_service"></a> [service](#output\_service) | Provider peering service that is managing peering connectivity for a service provider organization. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

Portions of this page are reproduced from work created and [shared by Google][policies] and used according to terms
described in the [Creative Commons 4.0 Attribution License][CC-BY-4.0].

[policies]: https://developers.google.com/readme/policies
[CC-BY-4.0]: https://creativecommons.org/licenses/by/4.0/
