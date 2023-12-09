# CircleCI

Creates an IAM user for the AWS account and a CircleCI context for that account.

## Prerequisites

*   A [CircleCI personal API token](https://circleci.com/docs/managing-api-tokens/#creating-a-personal-api-token)

## Deployment

```bash
terragrunt init
terragrunt apply
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | <= 1.5.5 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.0 |
| <a name="requirement_circleci"></a> [circleci](#requirement\_circleci) | 0.6.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.67.0 |
| <a name="provider_circleci"></a> [circleci](#provider\_circleci) | 0.6.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_role.pipeline](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_user.circleci](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user) | resource |
| [aws_iam_user_policy.circleci_assume_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_policy) | resource |
| [circleci_context.main](https://registry.terraform.io/providers/mrolla/circleci/0.6.1/docs/resources/context) | resource |
| [circleci_context_environment_variable.aws_account_id](https://registry.terraform.io/providers/mrolla/circleci/0.6.1/docs/resources/context_environment_variable) | resource |
| [circleci_context_environment_variable.region](https://registry.terraform.io/providers/mrolla/circleci/0.6.1/docs/resources/context_environment_variable) | resource |
| [circleci_context_environment_variable.role](https://registry.terraform.io/providers/mrolla/circleci/0.6.1/docs/resources/context_environment_variable) | resource |
| [aws_iam_policy_document.aws_assume_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.circleci_user](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_account_id"></a> [aws\_account\_id](#input\_aws\_account\_id) | The AWS account to deploy to. | `string` | n/a | yes |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | The AWS region this is hosted in. | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment to deploy to. | `string` | n/a | yes |
| <a name="input_secrets"></a> [secrets](#input\_secrets) | Values from the `secrets.sops.yaml` file. | `map(any)` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
