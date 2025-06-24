resource "azurerm_network_security_group" "asp" {
  name                = var.nsg_name_asp
  location            = azurerm_resource_group.ntwk-rg.location
  resource_group_name = azurerm_resource_group.ntwk-rg.name
}

resource "azurerm_network_security_group" "as" {
  name                = var.nsg_name_as
  location            = azurerm_resource_group.ntwk-rg.location
  resource_group_name = azurerm_resource_group.ntwk-rg.name
}