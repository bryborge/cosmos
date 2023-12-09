locals {
  tags = {
    Name        = "Personal Blog"
    Region      = var.aws_region
    Environment = var.environment
    GithubRepo  = "cosmos"
    GithubOrg   = "bryborge"
  }
}

provider "aws" {
  region              = var.aws_region
  allowed_account_ids = [var.aws_account_id]

  default_tags {
    tags = local.tags
  }
}

module "s3_bucket_site" {
  source = "../../../modules/s3-bucket-site"

  aws_account_id         = var.aws_account_id
  aws_region             = var.aws_region
  environment            = var.environment
  bucket_name            = var.bucket_name
  index_html             = var.index_html
  error_html             = var.error_html
  cloudfront_price_class = var.cloudfront_price_class
  domain_name            = var.domain_name
  dns_record_type        = "A"
}
