packer {
  required_version = ">= 1.8.0"

  required_plugins {
    proxmox = {
      version = ">= 1.0.8"
      source  = "github.com/hashicorp/proxmox"
    }
    docker = {
      version = ">= 0.0.7"
      source  = "github.com/hashicorp/docker"
    }
  }
}

build {
  source "proxmox.config" {
    template_name        = var.image_fullname
    template_description = var.image_description

    provisioner "shell" {
      script = "scripts/setup-cloud-init.sh"
    }

    provisioner "shell" {
      script = "scripts/install-docker.sh"
    }

    // post-processors ...
  }

  source "docker.config" {
    post-processors {
      post-processor "docker-tag" {
        repository = "sonofborge/${var.image_fullname}"
        tag        = [var.image_version]
      }
      post-processor "docker-push" {}
    }
  }

  // source "amazon-ebs.config" {

  // }
}
