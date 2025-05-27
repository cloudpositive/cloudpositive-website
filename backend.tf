terraform {
  cloud {
    organization = "cloud-positive"
    workspaces {
      name = "website-infra"
    }
  }
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "3.3.2"
    }
  }
  required_version = ">= 1.12.0"
}

resource "random_id" "name" {
  byte_length = 4
	prefix      = "website--"
}