output "key_vault_name" {
  description = "Vault name (use in GitHub variable KEYVAULT_NAME_*)."
  value       = azurerm_key_vault.MetaMentorKeyVault.name
}

output "key_vault_id" {
  description = "Resource ID of the Key Vault."
  value       = azurerm_key_vault.MetaMentorKeyVault.id
}
