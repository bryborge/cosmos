# Aliases for Terragrunt.
#   Docs: https://terragrunt.gruntwork.io/docs/reference/config-blocks-and-attributes/#locals
locals {
  path = path_relative_to_include()

  # Fetch the default environment from the path the service is in.
  environment_component_of_path = split("/", local.path)[0]
  default_environment           = local.environment_component_of_path
  environment                   = get_env("ENVIRONMENT", local.default_environment)

  account_id = get_env("ACCOUNT_ID", get_aws_account_id())

  # Fetch the region from the environment automatically in the following order:
  #   Docs: https://docs.aws.amazon.com/sdkref/latest/guide/feature-region.html
  #   1. AWS_REGION
  #   2. AWS_DEFAULT_REGION
  #   3. The return value from `aws configure get region`
  default_region = get_env("AWS_DEFAULT_REGION", try(run_cmd("--terragrunt-quiet", "aws", "configure", "get", "region"), ""))
  region         = get_env("AWS_REGION", local.default_region)

  bucket_name    = "tf-${local.environment}-${local.region}-${local.account_id}"
  dynamodb_table = "tf-lock-${local.environment}"
  default_vars   = yamldecode(file("${get_parent_terragrunt_dir()}/defaults.yml"))
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
    bucket         = local.bucket_name
    key            = "infrastructure/${local.path}/${local.account_id}/${local.region}/terraform.tfstate"
    region         = local.region
    dynamodb_table = local.dynamodb_table
  }
}

inputs = merge({
  aws_account_id             = local.account_id
  aws_region                 = local.region
  environment                = local.environment
  environment_bucket         = local.bucket_name
  environment_dynamodb_table = local.dynamodb_table

  tags = {
    "Region"              = local.region,
    "Environment"         = local.environment,
    "DeploymentDirectory" = local.path,
  }
}, local.default_vars)
