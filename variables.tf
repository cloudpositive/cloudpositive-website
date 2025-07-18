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

variable "wordpress_db_name" {
  description = "The name of the WordPress database"
  type        = string
  default     = "wordpress"
}