resource "azurerm_linux_web_app" "wordpress" {
  name                    = var.app_service_name
  location                = azurerm_resource_group.frontend-rg.location
  resource_group_name     = azurerm_resource_group.frontend-rg.name
  service_plan_id         = azurerm_service_plan.wordpress_plan.id
  client_affinity_enabled = false
  #  client_certificate_enabled               = false
  #  client_certificate_mode                  = "Required"
  enabled                                        = true
  ftp_publish_basic_authentication_enabled       = true
  https_only                                     = false
  public_network_access_enabled                  = true
  virtual_network_backup_restore_enabled         = false
  virtual_network_subnet_id                      = azurerm_subnet.cpw-app.id
  webdeploy_publish_basic_authentication_enabled = true
  identity {
    type         = "UserAssigned"
    identity_ids = [azurerm_user_assigned_identity.wordpress_uami.id]
  }
  app_settings = {
    WEBSITES_ENABLE_APP_SERVICE_STORAGE = true
    DATABASE_HOST                       = "cpw-p-data-mfs.mysql.database.azure.com"
    DATABASE_NAME                       = var.wordpress_db_name
    DATABASE_USERNAME                   = var.mysql_flexible_administrator_login
    DATABASE_PASSWORD                   = var.mysql_flexible_administrator_password
    AFD_ENABLED                         = true
    AFD_ENDPOINT                        = "cloudpositive-web-aecqcmcydugacbgv.z03.azurefd.net"
    WP_HOME                             = "https://cloudpositive.eu"
    SETUP_PHPMYADMIN                    = true
  }
  site_config {
    always_on                               = false
    container_registry_use_managed_identity = false
    default_documents                       = ["Default.htm", "Default.html", "Default.asp", "index.htm", "index.html", "iisstart.htm", "default.aspx", "index.php", "hostingstart.html"]
    ftps_state                              = "FtpsOnly"
    #    health_check_eviction_time_in_min             = 2
    #    health_check_path                             = "/"
    http2_enabled               = false
    load_balancing_mode         = "LeastRequests"
    local_mysql_enabled         = false
    managed_pipeline_mode       = "Integrated"
    minimum_tls_version         = "1.2"
    remote_debugging_enabled    = false
    scm_minimum_tls_version     = "1.2"
    scm_use_main_ip_restriction = false
    use_32_bit_worker           = true
    vnet_route_all_enabled      = false
    websockets_enabled          = false
    worker_count                = 1
    application_stack {
      docker_image_name = var.app_service_plan_image

    }
  }
}
