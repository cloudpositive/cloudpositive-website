resource "azurerm_private_dns_zone" "pdns_mysql" {
  name                = "privatelink.mysql.database.azure.com"
  resource_group_name = azurerm_resource_group.ntwk-rg.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "vnet_link_mysql" {
  name                  = azurerm_private_dns_zone.pdns_mysql.name
  private_dns_zone_name = azurerm_private_dns_zone.pdns_mysql.name
  virtual_network_id    = azurerm_virtual_network.cpw.id
  resource_group_name   = azurerm_resource_group.ntwk-rg.name
  depends_on = [ azurerm_subnet.cpw-mysql, azurerm_private_dns_zone.pdns_mysql ]
}
resource "azurerm_private_dns_zone" "pdns_blob" {
  name                = "privatelink.blob.core.windows.net"
  resource_group_name = azurerm_resource_group.ntwk-rg.name
}
resource "azurerm_private_dns_zone_virtual_network_link" "vnet_link_blob" {
  name                  = azurerm_private_dns_zone.pdns_blob.name
  private_dns_zone_name = azurerm_private_dns_zone.pdns_blob.name
  virtual_network_id    = azurerm_virtual_network.cpw.id
  resource_group_name   = azurerm_resource_group.ntwk-rg.name
}