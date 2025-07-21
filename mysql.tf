resource "azurerm_mysql_flexible_server" "mysql" {
  name                   = "cpw-p-data-mfs"
  resource_group_name    = azurerm_resource_group.data-rg.name
  location               = azurerm_resource_group.data-rg.location
  administrator_login    = var.mysql_flexible_administrator_login
  administrator_password = var.mysql_flexible_administrator_password
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
  charset             = "utf8mb3"
  collation           = "utf8mb3_general_ci"
}