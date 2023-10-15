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
  bucket_name            = var.bucket_name
  index_html             = var.index_html
  error_html             = var.error_html
  cloudfront_price_class = var.cloudfront_price_class
}

data "aws_iam_policy_document" "cicd_deployer" {
  statement {
    actions = ["s3:*"]

    resources = [
      "arn:aws:s3:::${var.bucket_name}/*",
      "arn:aws:s3:::${var.bucket_name}"
    ]
  }
}

resource "aws_iam_user" "cicd_deployer" {
  name = "cicd_deployer"
}

resource "aws_iam_access_key" "cicd_deployer" {
  user = aws_iam_user.cicd_deployer.name
}

resource "aws_iam_user_policy" "cicd_deployer" {
  name   = "cicd_deployer_user_policy"
  user   = aws_iam_user.cicd_deployer.name
  policy = data.aws_iam_policy_document.cicd_deployer.json
}
