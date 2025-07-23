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
  depends_on = [
    azurerm_mysql_flexible_server.mysql,
    azurerm_mysql_flexible_database.wordpress_db,
    azurerm_private_endpoint.mysql_pe,
    azurerm_storage_account.wordpress_blob_storage,
    azurerm_storage_container.wordpress_media,
    azurerm_storage_share.wordpress_content_share
  ]
  app_settings = {
    WEBSITES_ENABLE_APP_SERVICE_STORAGE   = true
    WORDPRESS_LOCAL_STORAGE_CACHE_ENABLED = true
    WORDPRESS_ADMIN_USERNAME              = var.wordpress_administrator_login
    WORDPRESS_ADMIN_PASSWORD              = var.wordpress_administrator_password
    #    ENABLE_EMAIL_MANAGED_IDENTITY         = true #Needed if using Azure Communication Services
    #    WP_EMAIL_CONNECTION_STRING =  endpoint=htt........ Required to enable outbound email via ACS
    DATABASE_HOST        = "cpw-p-data-mfs.mysql.database.azure.com"
    DATABASE_NAME        = var.wordpress_db_name
    DATABASE_USERNAME    = var.mysql_flexible_administrator_login
    DATABASE_PASSWORD    = var.mysql_flexible_administrator_password
    AFD_ENABLED          = true
    AFD_ENDPOINT         = "cloudpositive-web-aecqcmcydugacbgv.z03.azurefd.net"
    WP_HOME              = "https://cloudpositive.eu"
    WP_SITEURL           = "https://cloudpositive.eu"
    SETUP_PHPMYADMIN     = true
    WEBSITE_TIME_ZONE    = "W. Europe Standard Time"
    BLOB_STORAGE_URL     = "https://cpwpdatasta.blob.core.windows.net/wordpressmedia"
    BLOB_CONTAINER_NAME  = azurerm_storage_container.wordpress_media.name
    BLOB_STORAGE_ENABLED = true
    STORAGE_ACCOUNT_KEY  = azurerm_storage_account.wordpress_blob_storage.primary_access_key
    STORAGE_ACCOUNT_NAME = azurerm_storage_account.wordpress_blob_storage.name
    CUSTOM_DOMAIN        = "cloudpositive.eu"
  }
  storage_account {
    name         = "wordpress-content-mount" # A descriptive name for this mount configuration
    account_name = azurerm_storage_account.wordpress_blob_storage.name
    share_name   = azurerm_storage_share.wordpress_content_share.name
    mount_path   = "/home/site/wwwroot" # <<< CRITICAL CHANGE: Mount to wp-content!
    access_key   = azurerm_storage_account.wordpress_blob_storage.primary_access_key
    type         = "AzureFiles"
  }
  site_config {
    always_on                               = true
    container_registry_use_managed_identity = false
    default_documents                       = ["Default.htm", "Default.html", "Default.asp", "index.htm", "index.html", "iisstart.htm", "default.aspx", "index.php", "hostingstart.html"]
    ftps_state                              = "FtpsOnly"
    health_check_eviction_time_in_min       = 2
    health_check_path                       = "/"
    http2_enabled                           = true
    load_balancing_mode                     = "LeastRequests"
    local_mysql_enabled                     = false
    managed_pipeline_mode                   = "Integrated"
    minimum_tls_version                     = "1.2"
    remote_debugging_enabled                = false
    scm_minimum_tls_version                 = "1.2"
    scm_use_main_ip_restriction             = false
    use_32_bit_worker                       = false
    vnet_route_all_enabled                  = false
    websockets_enabled                      = false
    worker_count                            = 1
    application_stack {
      docker_image_name = var.app_service_plan_image
    }
  }
}
