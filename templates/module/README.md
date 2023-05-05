# Title

Enter a description here (e.g., "Module to create database.").

Documentation is created with [terraform-docs](https://terraform-docs.io/).
To generate, run:

```sh
terraform-docs markdown table --output-file README.md --output-mode inject .
```

## Usage

```sh
module "local_module" {
  source = "../modules"

  name = "${local.name}-test-module"
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >=3.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >=3.0.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_policy_document.assume_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | The name that identifies the resource | `string` | n/a | yes |
| <a name="input_stage"></a> [stage](#input\_stage) | The stage to deploy to | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_example"></a> [example](#output\_example) | Name passed in as a variable. |
<!-- END_TF_DOCS -->
