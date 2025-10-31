variable "name" {
  description = "A name which will be pre-pended to the resources created"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group to deploy the service into"
  type        = string
}

variable "sku" {
  description = "The SKU of the server instance to deploy"
  type        = string
  default     = "B_Standard_B1ms"
}

variable "postgresql_version" {
  description = "The version of PostgreSQL to deploy"
  type        = string
  default     = "16"
}

variable "subnet_id" {
  description = "The ID of a subnet to bind the database service into (must be delegated to 'Microsoft.DBforPostgreSQL/flexibleServers')"
  type        = string
}

variable "vnet_id" {
  description = "The ID of the VNet for private DNS zone linking"
  type        = string
}

variable "db_name" {
  description = "The name of the database to create"
  type        = string
}

variable "db_username" {
  description = "The name of the administration user to create"
  type        = string
}

variable "db_password" {
  description = "The password of the administration user to create"
  type        = string
  sensitive   = true
}

variable "max_allocated_storage_mb" {
  description = "The maximum size of the attached disk in MB (minimum 32768 for flexible server)"
  type        = number
  default     = 32768
}

variable "backup_retention_days" {
  description = "The number of days to retain backups"
  type        = number
  default     = 7
}

variable "tags" {
  description = "The tags to append to this resource"
  default     = {}
  type        = map(string)
}
