variable "app_name" {
  type = string
  description = "Application name of the key vault."
}

variable "resource_group_name" {
  type = string
  description = "Resource group name of the key vault."
}

variable "location" {
  type = string
  description = "Location of the key vault."
}

variable "tenant_id" {
  type = string
  description = "Tenant ID of the Azure Active Directory tenant."
}

variable "sp_object_id" {
  type = string
  description = "Object ID of the service principal to grant access to the key vault."
}

variable "secrets" {
  sensitive = true
  type      = map(string)
  description = "Map of secrets to store in the key vault."
}