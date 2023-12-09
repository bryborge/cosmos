provider "aws" {
  region              = var.aws_region
  allowed_account_ids = [var.aws_account_id]
}

provider "circleci" {
  api_token    = var.secrets.circleci.api_token
  vcs_type     = "github"
  organization = "bryborge"
}

# AWS - IAM Role
resource "aws_iam_role" "pipeline" {
  name               = "circleci-role"
  assume_role_policy = data.aws_iam_policy_document.aws_assume_role.json

  inline_policy {
    name   = "${var.environment}-${var.aws_region}-circleci-policy"
    policy = templatefile("../../../../modules/iam/policies/circleci.tmpl", {})
  }
}

# AWS - IAM User
resource "aws_iam_user" "circleci" {
  name = "circleci-user"
}

resource "aws_iam_user_policy" "circleci_assume_role" {
  name   = "account-access"
  user   = aws_iam_user.circleci.name
  policy = data.aws_iam_policy_document.circleci_user.json
}

# TODO: remove in favor of OIDC
resource "aws_iam_access_key" "circleci" {
  user = aws_iam_user.circleci.name
}

# CircleCI - Context
resource "circleci_context" "main" {
  name = var.environment
}

resource "circleci_context_environment_variable" "aws_account_id" {
  variable   = "AWS_ACCOUNT_ID"
  value      = var.aws_account_id
  context_id = circleci_context.main.id
}

resource "circleci_context_environment_variable" "iam_user_key_id" {
  variable   = "AWS_ACCESS_KEY_ID"
  value      = aws_iam_access_key.circleci.id
  context_id = circleci_context.main.id
}

resource "circleci_context_environment_variable" "iam_user_key_secret" {
  variable   = "AWS_SECRET_ACCESS_KEY"
  value      = aws_iam_access_key.circleci.secret
  context_id = circleci_context.main.id
}

resource "circleci_context_environment_variable" "region" {
  variable   = "AWS_DEFAULT_REGION"
  value      = var.aws_region
  context_id = circleci_context.main.id
}

resource "circleci_context_environment_variable" "role" {
  variable   = "AWS_CIRCLECI_ROLE"
  value      = aws_iam_role.pipeline.arn
  context_id = circleci_context.main.id
}
