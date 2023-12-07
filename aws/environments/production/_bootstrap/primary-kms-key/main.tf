provider "aws" {
  region = var.aws_region
}

module "kms" {
  source = "../../../../modules/kms"

  alias       = "primary"
  description = "The primary KMS key with the default KMS policy."
}
