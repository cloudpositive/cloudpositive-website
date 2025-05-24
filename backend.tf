terraform { 
  cloud { 
    
    organization = "cloud-positive" 

    workspaces { 
      name = "website-infra" 
    }

  } 
}

