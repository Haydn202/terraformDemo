output "api_key" {
  description = "Deployment token for Azure/static-web-apps-deploy (GitHub secret AZURE_STATIC_WEB_APPS_API_TOKEN)."
  value       = azurerm_static_web_app.MetaMentorStaticWebApp.api_key
  sensitive   = true
}

output "default_host_name" {
  description = "Default hostname of the Static Web App."
  value       = azurerm_static_web_app.MetaMentorStaticWebApp.default_host_name
}
