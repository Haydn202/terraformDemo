resource "azurerm_static_web_app" "MetaMentorStaticWebApp" {
  name                = var.app_name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku_size            = "Free"
  sku_tier            = "Free"
  tags                = var.tags
}