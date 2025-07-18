resource "azurerm_mysql_flexible_server" "mysql" {
  name                   = "cpw-p-data-mfs"
  resource_group_name    = azurerm_resource_group.data-rg.name
  location               = azurerm_resource_group.data-rg.location
  administrator_login    = "psqladmin"
  administrator_password = "H@Sh1CoR3!"
  delegated_subnet_id    = azurerm_subnet.cpw-mysql.id
  private_dns_zone_id    = azurerm_private_dns_zone.pdns_mysql.id
  sku_name               = "B_Standard_B1ms"
  version                = "8.0.21"
  depends_on = [ azurerm_private_dns_zone_virtual_network_link.vnet_link_mysql ]
}

resource "azurerm_mysql_flexible_server_configuration" "mfs_configuration" {
  name      = "sql_generate_invisible_primary_key"
  resource_group_name = azurerm_resource_group.data-rg.name
  server_name = azurerm_mysql_flexible_server.mysql.name
  value     = "off"
}

resource "azurerm_mysql_flexible_database" "wordpress_db" {
  name                = var.wordpress_db_name
  resource_group_name = azurerm_resource_group.data-rg.name
  server_name         = azurerm_mysql_flexible_server.mysql.name
  charset             = "utf8"
  collation           = "utf8_general_ci"
}