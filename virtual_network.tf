resource "azurerm_virtual_network" "cpw" {
  name                = "cpw-p-ntwk-vnet"
  address_space       = ["172.16.0.0/23"]
  location            = azurerm_resource_group.ntwk-rg.location
  resource_group_name = azurerm_resource_group.ntwk-rg.name
}

resource "azurerm_subnet" "cpw-app" {
  name                 = "cpw-p-ntwk-subnet-app"
  resource_group_name  = azurerm_resource_group.ntwk-rg.name
  virtual_network_name = azurerm_virtual_network.cpw.name
  address_prefixes     = ["172.16.0.0/25"]
  delegation {
    name = "cpw-p-ntwk-subnet-app-delegation"
    service_delegation {
      name    = "Microsoft.Web/serverFarms"
      actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
    }
  }
}

resource "azurerm_subnet" "cpw-mysql" {
  name                 = "cpw-p-ntwk-subnet-mys"
  resource_group_name  = azurerm_resource_group.ntwk-rg.name
  virtual_network_name = azurerm_virtual_network.cpw.name
  address_prefixes     = ["172.16.0.128/25"]
}

resource "azurerm_subnet" "cpw-blob-pe" {
  name                 = "cpw-p-ntwk-subnet-blob-pe"
  resource_group_name  = azurerm_resource_group.ntwk-rg.name
  virtual_network_name = azurerm_virtual_network.cpw.name
  address_prefixes     = ["172.16.1.224/28"]
}

resource "azurerm_subnet_network_security_group_association" "app" {
  subnet_id                 = azurerm_subnet.cpw-app.id
  network_security_group_id = azurerm_network_security_group.app.id
}

resource "azurerm_subnet_network_security_group_association" "mys" {
  subnet_id                 = azurerm_subnet.cpw-mysql.id
  network_security_group_id = azurerm_network_security_group.mys.id
}
resource "azurerm_subnet_network_security_group_association" "blob" {
  subnet_id                 = azurerm_subnet.cpw-blob-pe.id
  network_security_group_id = azurerm_network_security_group.blob.id
}