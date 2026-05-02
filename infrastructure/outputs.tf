output "static_web_app_url" {
  description = "HTTPS URL for the site (after deploy)."
  value       = "https://${module.staticwebapp.default_host_name}"
}

output "static_web_app_deployment_token" {
  description = "Set as GitHub repository secret AZURE_STATIC_WEB_APPS_API_TOKEN. terraform output -raw static_web_app_deployment_token"
  value       = module.staticwebapp.api_key
  sensitive   = true
}
