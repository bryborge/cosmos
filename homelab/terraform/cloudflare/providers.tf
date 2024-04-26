terraform {
  cloud {
    organization = "bryborge"

    workspaces {
      name = "cloudflare-tf"
    }
  }

  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 3.0"
    }
  }
}

provider "cloudflare" {}
