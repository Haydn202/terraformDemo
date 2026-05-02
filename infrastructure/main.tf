module "resourcegroup" {
  source              = "./modules/resourcegroup"
  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = local.common_tags
}

module "staticwebapp" {
  source              = "./modules/staticwebapp"
  app_name            = var.app_name
  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = local.common_tags

  depends_on = [
    module.resourcegroup
  ]
}

module "keyvault" {
  source              = "./modules/keyvault"
  app_name            = var.app_name
  resource_group_name = var.resource_group_name
  location            = var.location
  tenant_id           = var.tenant_id
  sp_object_id        = var.service_principal_object_id
  secrets             = {
    "AZURE_STATIC_WEB_APPS_API_TOKEN_${var.environment}" = module.staticwebapp.api_key
  }
}