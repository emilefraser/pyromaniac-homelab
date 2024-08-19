terraform {
  required_providers {
    proxmox = {
      source = "Telmate/proxmox"
      version = "2.9.1"
    }
  }
}


terraform {
  cloud {
    organization = "my-org"
    hostname = "app.terraform.io" # Optional; defaults to app.terraform.io

    workspaces {
      project = "networking-development"
      tags = ["networking", "source:cli"]
    }
  }
}

provider "proxmox" {
    pm_api_url = "https://localhost:8006/api2/json"
    pm_user = "root@pam"
    pm_tls_insecure = true
    pm_password = "105022_Alpha"
    pm_timeout = 600
}