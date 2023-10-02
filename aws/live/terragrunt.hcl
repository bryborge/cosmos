locals {
  account_id  = get_env("ACCOUNT_ID", get_aws_account_id())

  # Parse the file path we're in to read the env name: e.g., env will be "development" in the development folder,
  # "staging" in the staging folder, etc.
  parsed = regex(".*/live/(?P<env>.*?)/.*", get_terragrunt_dir())
  env    = local.parsed.env

  # Fetch the region from the environment automatically in the following order:
  #   Docs: https://docs.aws.amazon.com/sdkref/latest/guide/feature-region.html
  #   1. AWS_REGION
  #   2. AWS_DEFAULT_REGION
  #   3. The return value from `aws configure get region`
  default_region = get_env("AWS_DEFAULT_REGION", try(run_cmd("--terragrunt-quiet", "aws", "configure", "get", "region"), ""))
  region         = get_env("AWS_REGION", local.default_region)
}

# Remote state configuration.
#   Docs: https://terragrunt.gruntwork.io/docs/reference/config-blocks-and-attributes/#remote_state
remote_state {
  backend = "s3"

  generate = {
    path      = "backend.tf"
    if_exists = "overwrite"
  }

  config = {
    encrypt        = true
    bucket         = "tf-${local.env}-${local.region}-${local.account_id}"
    key            = "iac/${local.env}/${local.account_id}/${local.region}/terraform.tfstate"
    region         = local.region
    dynamodb_table = "tf-lock-${local.env}"
  }
}

inputs = {
  aws_account_id = local.account_id
  aws_region     = local.region
  environment    = local.env
}
