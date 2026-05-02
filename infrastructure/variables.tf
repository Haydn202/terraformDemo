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

variable "github_actions_sp_object_id" {
  type        = string
  default     = ""
  description = "Object ID of the Entra ID app used by GitHub OIDC (federated credential). Granted Key Vault secret Get/List. Set after creating the federated credential, then re-apply."
}