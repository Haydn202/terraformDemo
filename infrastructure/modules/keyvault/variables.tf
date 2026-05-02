variable "app_name" {
  type        = string
  description = "Application name of the key vault."
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name of the key vault."
}

variable "location" {
  type        = string
  description = "Location of the key vault."
}

variable "tenant_id" {
  type        = string
  description = "Tenant ID of the Azure Active Directory tenant."
}

variable "sp_object_id" {
  type        = string
  description = "Object ID of the service principal to grant access to the key vault."
}

variable "github_actions_sp_object_id" {
  type        = string
  default     = ""
  description = "Object ID of the GitHub Actions OIDC service principal (repo workload identity). Get + List secrets only. Leave empty to skip."
}

variable "environment" {
  type        = string
  description = "Used in the SWA deployment token secret name (e.g. dev, prod)."
}

variable "swa_deployment_token" {
  sensitive   = true
  type        = string
  description = "Azure Static Web Apps deployment token (api_key) to store in Key Vault."
}