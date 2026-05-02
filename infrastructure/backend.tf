terraform {
  backend "azurerm" {
    resource_group_name  = "meta-mentor-storage"
    storage_account_name = "metamentorstorage"
    container_name       = "meta-mentor-tfstate"
    key                  = "terraform.tfstate"
  }
}