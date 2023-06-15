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
  default     = "GP_Gen5_2"
}

variable "postgresql_version" {
  description = "The version of PostgreSQL to deploy"
  type        = string
  default     = "11"
}

variable "subnet_id" {
  description = "The ID of a subnet to bind the database service into (must have 'Microsoft.Sql' enabled as a service_endpoint)"
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

variable "publicly_accessible" {
  description = "Whether to make this instance accessible over the internet"
  type        = bool
  default     = true
}

variable "additional_ip_allowlist" {
  description = "An optional list of CIDR ranges to allow traffic from"
  type        = list(any)
  default     = []
}

variable "max_allocated_storage_mb" {
  description = "The maximum size of the attached disk in MB"
  type        = number
  default     = 10240
}

variable "auto_grow_enabled" {
  description = "Whether the disk space should automatically expand"
  type        = bool
  default     = false
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
