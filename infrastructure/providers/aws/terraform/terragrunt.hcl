locals {
  // account_id  = get_env("ACCOUNT_ID", get_aws_account_id())
  account_id  = "388372205874"
  environment = get_env("ENVIRONMENT")
  region      = get_env("AWS_REGION")

  bucket_name    = "terraform-${local.environment}-${local.region}-${local.account_id}"
  dynamodb_table = "terraform-lock-${local.environment}"
}

remote_state {
  backend = "s3"

  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }

  config = {
    bucket         = local.bucket_name
    key            = "cosmos/${path_relative_to_include()}/${local.account_id}/${local.region}/terraform.tfstate"
    region         = local.region
    encrypt        = true
    dynamodb_table = local.dynamodb_table
  }
}
