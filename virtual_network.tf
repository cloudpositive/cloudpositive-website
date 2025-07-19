resource "azurerm_virtual_network" "cpw" {
  name                = "cpw-p-ntwk-vnet"
  address_space       = ["172.16.0.0/23"]
  location            = azurerm_resource_group.ntwk-rg.location
  resource_group_name = azurerm_resource_group.ntwk-rg.name
}

resource "azurerm_subnet" "cpw-asp" {
  name                 = "cpw-p-ntwk-subnet-asp"
  resource_group_name  = azurerm_resource_group.ntwk-rg.name
  virtual_network_name = azurerm_virtual_network.cpw.name
  address_prefixes     = ["172.16.0.0/25"]
  delegation {
    name = "cpw-p-ntwk-subnet-asp-delegation"
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

  delegation {
    name = "cpw-p-ntwk-subnet-mys-delegation"
    service_delegation {
      name    = "Microsoft.DBforMySQL/flexibleServers"
      actions = ["Microsoft.Network/virtualNetworks/subnets/join/action"]
    }
  }
}

resource "azurerm_subnet_network_security_group_association" "asp" {
  subnet_id                 = azurerm_subnet.cpw-asp.id
  network_security_group_id = azurerm_network_security_group.asp.id
}

resource "azurerm_subnet_network_security_group_association" "mys" {
  subnet_id                 = azurerm_subnet.cpw-mysql.id
  network_security_group_id = azurerm_network_security_group.mys.id
}