resource "azurerm_private_endpoint" "mysql_pe" {
  name                = "cpw-p-data-mfs-pe"
  location            = azurerm_resource_group.data-rg.location
  resource_group_name = azurerm_resource_group.data-rg.name
  subnet_id           = azurerm_subnet.cpw-mysql.id
  private_dns_zone_group {
    name                 = "default"
    private_dns_zone_ids = [azurerm_private_dns_zone.pdns_mysql.id]
  }

  private_service_connection {
    name                           = "cpw-p-data-mfs-psc"
    private_connection_resource_id = azurerm_mysql_flexible_server.mysql.id
    subresource_names              = ["mysqlServer"]
    is_manual_connection           = false
  }

  custom_network_interface_name = "cpw-p-data-mfs-pe-nic"
}

resource "azurerm_private_endpoint" "wordpress_blob_storage_pe" {
  name                = "cpw-p-data-cpwblob-pe"
  location            = azurerm_resource_group.data-rg.location
  resource_group_name = azurerm_resource_group.data-rg.name
  subnet_id           = azurerm_subnet.cpw-mysql.id
  private_dns_zone_group {
    name                 = "default"
    private_dns_zone_ids = [azurerm_private_dns_zone.pdns_blob.id]
  }

  private_service_connection {
    name                           = "cpw-p-data-cpwblob-psc"
    private_connection_resource_id = azurerm_storage_account.wordpress_blob_storage.id
    subresource_names              = ["blob"]
    is_manual_connection           = false
  }
  custom_network_interface_name = "cpw-p-data-cpwblob-pe-nic"
}