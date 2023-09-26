terraform {
  required_version = "~> 1.5.0"

  required_providers {
    # Docs: https://registry.terraform.io/providers/hashicorp/aws/latest/docs
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}
