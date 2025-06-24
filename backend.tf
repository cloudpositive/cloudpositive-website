terraform {
  cloud {
    organization = "cloud-positive"
    workspaces {
      name = "website-infra"
    }
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.34.0"
    }
  }
  required_version = ">= 1.12.0"
}

provider "azurerm" {
  resource_provider_registrations = "none"
  features {}
}