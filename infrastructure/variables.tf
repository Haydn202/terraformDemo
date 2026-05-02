variable "environment" {
  type        = string
  description = "Logical environment name (e.g. dev, prod) for tags and naming hints."
}

variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "app_name" {
  type        = string
  description = "Static Web App name; must be globally unique in Azure. Use distinct values per environment."
}

variable "subscription_id" {
  sensitive = true
  type      = string
}

variable "tenant_id" {
  sensitive = true
  type      = string
}

variable "service_principal_object_id" {
  sensitive = true
  type      = string
}