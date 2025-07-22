resource "azurerm_resource_group" "ntwk-rg" {
  name     = var.rg_name_ntwk
  location = var.deployment_azure_region
}

resource "azurerm_resource_group" "data-rg" {
  name     = var.rg_name_data
  location = var.deployment_azure_region
}

resource "azurerm_resource_group" "frontend-rg" {
  name     = var.rg_name_frontend
  location = var.deployment_azure_region
}
