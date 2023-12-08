locals {
  tags = {
    Name        = "Github Actions (CI/CD)"
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

# AWS - IAM Role
resource "aws_iam_role" "pipeline" {
  name               = "github-cicd-role"
  assume_role_policy = data.aws_iam_policy_document.aws_assume_role.json

  inline_policy {
    name   = "${var.environment}-${var.aws_region}-github-cicd-policy"
    policy = templatefile("../../../../../modules/iam/policies/ci.tmpl", {})
  }
}

# AWS - IAM User
resource "aws_iam_user" "github_cicd" {
  name = "github-cicd-user"
}

resource "aws_iam_user_policy" "github_cicd_assume_role" {
  name   = "account-access"
  user   = aws_iam_user.github_cicd_role.name
  policy = data.aws_iam_policy_document.github-cicd-role.json
}

# TODO: remove in favor of OIDC
resource "aws_iam_access_key" "github_cicd" {
  user = aws_iam_user.github_cicd.name
}
