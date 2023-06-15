output "db_host" {
  description = "The FQDN of the deployed database"
  value       = azurerm_postgresql_server.db.fqdn
}

output "db_port" {
  description = "The port to use when connecting to the database"
  value       = 5432
}

output "db_name" {
  description = "The name of the default database created"
  value       = azurerm_postgresql_database.db.name
}

output "db_username" {
  description = "The username to use when connecting to the database as the admin"
  value       = "${azurerm_postgresql_server.db.administrator_login}@${azurerm_postgresql_server.db.name}"
}

output "db_password" {
  description = "The password to use when connecting to the database as the admin"
  value       = azurerm_postgresql_server.db.administrator_login_password
  sensitive   = true
}
