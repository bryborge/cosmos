# Title

Enter a description here.

Documentation is created with [terraform-docs](https://terraform-docs.io/).
To generate, run:

```sh
terraform-docs markdown table --output-file README.md --output-mode inject .
```

## Deployment

```sh
terragrunt init
terragrunt apply
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.4.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 4.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_local_module"></a> [local\_module](#module\_local\_module) | ../modules | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_kms_alias.key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/kms_alias) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_account_id"></a> [aws\_account\_id](#input\_aws\_account\_id) | The AWS account to deploy to. | `string` | n/a | yes |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | The AWS region to deploy to. | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment to deploy to. | `string` | n/a | yes |
| <a name="input_stage"></a> [stage](#input\_stage) | The stage to deploy to. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_module_output"></a> [module\_output](#output\_module\_output) | Example output |
<!-- END_TF_DOCS -->
