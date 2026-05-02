resource "azurerm_key_vault" "MetaMentorKeyVault" {
  name                = "${var.app_name}-kv"
  resource_group_name = var.resource_group_name
  location            = var.location
  sku_name            = "standard"
  tenant_id           = var.tenant_id
}

resource "azurerm_key_vault_access_policy" "sp" {
  key_vault_id = azurerm_key_vault.MetaMentorKeyVault.id
  tenant_id    = var.tenant_id
  object_id    = var.sp_object_id

  secret_permissions = [
    "Get",
    "List",
    "Set",
    "Delete"
  ]
}

resource "azurerm_key_vault_access_policy" "github_actions" {
  count        = var.github_actions_sp_object_id != "" ? 1 : 0
  key_vault_id = azurerm_key_vault.MetaMentorKeyVault.id
  tenant_id    = var.tenant_id
  object_id    = var.github_actions_sp_object_id

  secret_permissions = [
    "Get",
    "List",
  ]
}

resource "azurerm_key_vault_secret" "swa_deployment_token" {
  name         = "SWA-TOKEN-${var.environment}"
  value        = var.swa_deployment_token
  key_vault_id = azurerm_key_vault.MetaMentorKeyVault.id

  depends_on = [azurerm_key_vault_access_policy.sp]
}