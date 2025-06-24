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