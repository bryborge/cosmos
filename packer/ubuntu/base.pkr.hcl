packer {
  required_version = ">= 1.8.0"

  required_plugins {
    proxmox = {
      version = ">= 1.0.8"
      source  = "github.com/hashicorp/proxmox"
    }
    amazon = {
      version = ">= 1.1.1"
      source  = "github.com/hashicorp/amazon"
    }
  }
}
