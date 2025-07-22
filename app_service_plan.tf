resource "azurerm_service_plan" "wordpress_plan" {
  location                        = azurerm_resource_group.frontend-rg.location
  resource_group_name             = azurerm_resource_group.frontend-rg.name
  name                            = var.app_service_plan_name
  os_type                         = "Linux"
  per_site_scaling_enabled        = false
  premium_plan_auto_scale_enabled = false
  sku_name                        = "P0v3"
  worker_count           = 1
  zone_balancing_enabled = false
}