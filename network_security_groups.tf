resource "azurerm_network_security_group" "asp" {
  name                = var.nsg_name_asp
  location            = azurerm_resource_group.ntwk-rg.location
  resource_group_name = azurerm_resource_group.ntwk-rg.name
}

resource "azurerm_network_security_group" "app" {
  name                = var.nsg_name_app
  location            = azurerm_resource_group.ntwk-rg.location
  resource_group_name = azurerm_resource_group.ntwk-rg.name
}

resource "azurerm_network_security_group" "mys" {
  name                = var.nsg_name_mys
  location            = azurerm_resource_group.ntwk-rg.location
  resource_group_name = azurerm_resource_group.ntwk-rg.name
  
}