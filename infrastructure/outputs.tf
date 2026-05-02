output "static_web_app_url" {
  description = "HTTPS URL for the site (after deploy)."
  value       = "https://${module.staticwebapp.default_host_name}"
}

output "static_web_app_deployment_token" {
  description = "SWA deployment token (also stored in Key Vault). Prefer reading from Key Vault in CI."
  value       = module.staticwebapp.api_key
  sensitive   = true
}

output "key_vault_name" {
  description = "Set as GitHub repository variable KEYVAULT_NAME_DEV or KEYVAULT_NAME_PROD (per environment apply)."
  value       = module.keyvault.key_vault_name
}

output "swa_token_secret_name" {
  description = "Key Vault secret name containing the deployment token for this environment."
  value       = "AZURE_STATIC_WEB_APPS_API_TOKEN_${var.environment}"
}
