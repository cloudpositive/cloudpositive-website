variable "deployment_azure_region" {
  description = "The Azure region where the resources will be deployed"
  type        = string
}

#resource groups

variable "rg_name_ntwk" {
  description = "The name of the Azure Resource Group"
  type        = string
}

variable "rg_name_data" {
  description = "The name of the Azure Resource Group"
  type        = string
}

variable "rg_name_frontend" {
  description = "The name of the Azure Resource Group"
  type        = string
}

variable "rg_name_app" {
  description = "The name of the Azure Resource Group for the Application Service"
  type        = string
  default     = "cpw-p-app-rg"

}

# NSGs
variable "nsg_name_asp" {
  description = "The name of the Azure Network Security Group for the Application Service Plan"
  type        = string
}

variable "nsg_name_app" {
  description = "The name of the Azure Network Security Group for the Application Service"
  type        = string
}

variable "nsg_name_mys" {
  description = "The name of the Azure Network Security Group for the MySQL Flexible Server"
  type        = string
}

variable "nsg_name_blob" {
  description = "The name of the Azure Network Security Group for the Blob Storage"
  type        = string
}
# WordPress Database
variable "wordpress_db_name" {
  description = "The name of the WordPress database"
  type        = string
  default     = "wordpress"
}
# MySQL Flexible Server
variable "mysql_flexible_administrator_login" {
  description = "The administrator login for the MySQL Flexible Server"
  type        = string
}

variable "mysql_flexible_administrator_password" {
  description = "The administrator password for the MySQL Flexible Server"
  type        = string
}

# App Service Plan and WordPress App Service
variable "app_service_plan_name" {
  description = "The name of the App Service Plan for WordPress"
  type        = string
}
variable "app_service_name" {
  description = "The name of the WordPress App Service"
  type        = string
}
variable "app_service_plan_image" {
  description = "The Docker image for the App Service Plan"
  type        = string
}