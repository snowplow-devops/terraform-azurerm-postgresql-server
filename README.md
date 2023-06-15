[![Release][release-image]][release] [![CI][ci-image]][ci] [![License][license-image]][license] [![Registry][registry-image]][registry]

# terraform-azurerm-postgresql-server

A Terraform module for deploying a simple PostgreSQL instance.

## Usage

Before deploying this module you will need to have a vNet deployed with a subnet that has `Microsoft.Sql` enabled as a `service_endpoint`.  Without this other servers you deploy into this subnet will _not_ be able to access the instance securely.

For a working example you can take a look at our [default vNet module](https://github.com/snowplow-devops/terraform-azurerm-vnet) we have for deploying a Snowplow Pipeline stack.

```hcl
module "snowplow_db" {
  source  = "snowplow-devops/postgresql-server/azurerm"

  name                = "snowplow-db"
  resource_group_name = var.resource_group_name

  subnet_id = var.subnet_id_for_servers

  db_name     = var.db_name
  db_username = var.db_username
  db_password = var.db_password
}
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.58.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >= 3.58.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_postgresql_database.db](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/postgresql_database) | resource |
| [azurerm_postgresql_firewall_rule.custom_rules](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/postgresql_firewall_rule) | resource |
| [azurerm_postgresql_server.db](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/postgresql_server) | resource |
| [azurerm_postgresql_virtual_network_rule.vnet_access](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/postgresql_virtual_network_rule) | resource |
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_db_name"></a> [db\_name](#input\_db\_name) | The name of the database to create | `string` | n/a | yes |
| <a name="input_db_password"></a> [db\_password](#input\_db\_password) | The password of the administration user to create | `string` | n/a | yes |
| <a name="input_db_username"></a> [db\_username](#input\_db\_username) | The name of the administration user to create | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | A name which will be pre-pended to the resources created | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group to deploy the service into | `string` | n/a | yes |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | The ID of a subnet to bind the database service into (must have 'Microsoft.Sql' enabled as a service\_endpoint) | `string` | n/a | yes |
| <a name="input_additional_ip_allowlist"></a> [additional\_ip\_allowlist](#input\_additional\_ip\_allowlist) | An optional list of CIDR ranges to allow traffic from | `list(any)` | `[]` | no |
| <a name="input_auto_grow_enabled"></a> [auto\_grow\_enabled](#input\_auto\_grow\_enabled) | Whether the disk space should automatically expand | `bool` | `false` | no |
| <a name="input_backup_retention_days"></a> [backup\_retention\_days](#input\_backup\_retention\_days) | The number of days to retain backups | `number` | `7` | no |
| <a name="input_max_allocated_storage_mb"></a> [max\_allocated\_storage\_mb](#input\_max\_allocated\_storage\_mb) | The maximum size of the attached disk in MB | `number` | `10240` | no |
| <a name="input_postgresql_version"></a> [postgresql\_version](#input\_postgresql\_version) | The version of PostgreSQL to deploy | `string` | `"11"` | no |
| <a name="input_publicly_accessible"></a> [publicly\_accessible](#input\_publicly\_accessible) | Whether to make this instance accessible over the internet | `bool` | `true` | no |
| <a name="input_sku"></a> [sku](#input\_sku) | The SKU of the server instance to deploy | `string` | `"GP_Gen5_2"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | The tags to append to this resource | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_db_host"></a> [db\_host](#output\_db\_host) | The FQDN of the deployed database |
| <a name="output_db_name"></a> [db\_name](#output\_db\_name) | The name of the default database created |
| <a name="output_db_password"></a> [db\_password](#output\_db\_password) | The password to use when connecting to the database as the admin |
| <a name="output_db_port"></a> [db\_port](#output\_db\_port) | The port to use when connecting to the database |
| <a name="output_db_username"></a> [db\_username](#output\_db\_username) | The username to use when connecting to the database as the admin |

# Copyright and license

The Terraform Azurerm PostgreSQL server project is Copyright 2023-present Snowplow Analytics Ltd.

Licensed under the [Apache License, Version 2.0][license] (the "License");
you may not use this software except in compliance with the License.

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

[release]: https://github.com/snowplow-devops/terraform-azurerm-postgresql-server/releases/latest
[release-image]: https://img.shields.io/github/v/release/snowplow-devops/terraform-azurerm-postgresql-server

[ci]: https://github.com/snowplow-devops/terraform-azurerm-postgresql-server/actions?query=workflow%3Aci
[ci-image]: https://github.com/snowplow-devops/terraform-azurerm-postgresql-server/workflows/ci/badge.svg

[license]: https://www.apache.org/licenses/LICENSE-2.0
[license-image]: https://img.shields.io/badge/license-Apache--2-blue.svg?style=flat

[registry]: https://registry.terraform.io/modules/snowplow-devops/postgresql-server/azurerm/latest
[registry-image]: https://img.shields.io/static/v1?label=Terraform&message=Registry&color=7B42BC&logo=terraform
