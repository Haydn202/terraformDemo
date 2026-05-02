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
  source                      = "./modules/keyvault"
  app_name                    = var.app_name
  resource_group_name         = var.resource_group_name
  location                    = var.location
  tenant_id                   = var.tenant_id
  sp_object_id                = var.service_principal_object_id
  github_actions_sp_object_id = var.github_actions_sp_object_id
  environment                 = var.environment
  swa_deployment_token        = module.staticwebapp.api_key

  depends_on = [
    module.staticwebapp
  ]
}