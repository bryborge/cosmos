terraform {
  required_version = "<= 1.5.5"

  required_providers {
    # Docs: https://registry.terraform.io/providers/hashicorp/aws/latest/docs
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# provider "aws" {
#   alias  = "acm_provider"
#   region = "us-east-1" # Must be us-east-1
# }
