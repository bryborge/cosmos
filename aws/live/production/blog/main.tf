provider "aws" {
  region              = var.aws_region
  allowed_account_ids = [var.aws_account_id]
}

locals {
  account_id = "388372205874"
  region     = "us-west-2"
  env        = "production"
}

module "s3_bucket_site" {
  source = "../../../modules/s3-bucket-site"

  aws_account_id         = local.account_id
  aws_region             = local.region
  environment            = local.env
  domain_name            = var.domain_name
  index_html             = var.index_html
  error_html             = var.error_html
  cloudfront_price_class = var.cloudfront_price_class
}
