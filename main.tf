data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

# Private DNS Zone for PostgreSQL Flexible Server
resource "azurerm_private_dns_zone" "postgres" {
  name                = "iglu.postgres.database.azure.com"
  resource_group_name = var.resource_group_name
  tags                = var.tags
}

# Link Private DNS Zone to VNet
resource "azurerm_private_dns_zone_virtual_network_link" "postgres" {
  name                  = "${var.name}-vnet-link"
  resource_group_name   = var.resource_group_name
  private_dns_zone_name = azurerm_private_dns_zone.postgres.name
  virtual_network_id    = var.vnet_id
  tags                  = var.tags
}

resource "azurerm_postgresql_flexible_server" "db" {
  name                = var.name
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = var.resource_group_name

  administrator_login    = var.db_username
  administrator_password = var.db_password

  sku_name   = var.sku
  version    = var.postgresql_version
  storage_mb = var.max_allocated_storage_mb

  backup_retention_days = var.backup_retention_days

  # Private VNet-integrated deployment
  delegated_subnet_id           = var.subnet_id
  private_dns_zone_id           = azurerm_private_dns_zone.postgres.id
  public_network_access_enabled = false

  tags = var.tags

  depends_on = [azurerm_private_dns_zone_virtual_network_link.postgres]

  lifecycle {
    ignore_changes = [
      zone,
      version,
    ]
  }
}

resource "azurerm_postgresql_flexible_server_database" "db" {
  name      = var.db_name
  server_id = azurerm_postgresql_flexible_server.db.id
  charset   = "UTF8"
  collation = "en_US.utf8"
}
