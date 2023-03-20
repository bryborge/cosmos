terraform {
  required_version = "~> 1.1.2"

  required_providers { 
    # Docs: https://registry.terraform.io/providers/hashicorp/aws/latest/docs
    aws = {
      source  = "hashicorp/aws" 
      version = "~> 4.0"
    }
  }
}
