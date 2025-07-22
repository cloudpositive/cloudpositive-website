resource "azurerm_storage_account" "wordpress_blob_storage" {
  name                     = "cpwpdatasta"
  resource_group_name      = azurerm_resource_group.data-rg.name
  location                 = azurerm_resource_group.data-rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"
  access_tier              = "Hot"
  allow_nested_items_to_be_public   = false
  cross_tenant_replication_enabled  = false
  default_to_oauth_authentication   = false
  dns_endpoint_type                 = "Standard"
  https_traffic_only_enabled        = true
  infrastructure_encryption_enabled = true
  is_hns_enabled                    = false
  large_file_share_enabled          = true
  local_user_enabled                = true
  min_tls_version                   = "TLS1_2"
  nfsv3_enabled                     = false
  public_network_access_enabled     = true
  queue_encryption_key_type         = "Service"
  sftp_enabled                      = false
  shared_access_key_enabled         = true
  table_encryption_key_type         = "Service"
    blob_properties {
    change_feed_enabled             = false
    default_service_version        = "2023-01-03"
    last_access_time_enabled       = false
    versioning_enabled             = false

    container_delete_retention_policy {
      days = 7
    }

    delete_retention_policy {
      days                     = 7
      permanent_delete_enabled = false
    }
  }

  share_properties {
    retention_policy {
      days = 7
    }
  }
}

resource "azurerm_storage_container" "wordpress_media" {
  name                  = "wordpressmedia"
  storage_account_id  = azurerm_storage_account.wordpress_blob_storage.id
  container_access_type = "private"
}