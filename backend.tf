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
	required_version = ">= 1.1.0"
}

backend "remote" {
  organization = "cloud-positive"

  workspaces {
    name = "website-infra"
  }
}