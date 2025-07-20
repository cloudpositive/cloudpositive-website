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
resource "azurerm_network_security_rule" "allow_mysql_inbound" {
  name                        = "AllowMySQLInbound"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_ranges     = ["3306"]
  source_address_prefixes     = ["172.16.0.0/25"] # subnet ASP
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.ntwk-rg.name
  network_security_group_name = azurerm_network_security_group.mys.name
}