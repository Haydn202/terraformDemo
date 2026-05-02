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

  validation {
    condition = (
      length(trimspace(var.service_principal_object_id)) > 0 &&
      can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", trimspace(var.service_principal_object_id)))
    )
    error_message = "service_principal_object_id must be a non-empty Entra object ID (UUID), not the application (client) ID. In GitHub Actions set AZURE_SERVICE_PRINCIPAL_OBJECT_ID and/or AZURE_GITHUB_ACTIONS_SP_OBJECT_ID to the Terraform/OIDC app registration object ID."
  }
}

variable "github_actions_sp_object_id" {
  type        = string
  default     = ""
  description = "Object ID of the Entra ID app used by GitHub OIDC (federated credential). Granted Key Vault secret Get/List. Set after creating the federated credential, then re-apply."
}