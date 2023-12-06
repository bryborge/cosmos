# Key Management Service

Creates a basic kms encryption key.

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

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 4.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_kms_alias.primary](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_alias) | resource |
| [aws_kms_key.primary](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alias"></a> [alias](#input\_alias) | The name of the KMS key alias. | `string` | n/a | yes |
| <a name="input_auto_rotate"></a> [auto\_rotate](#input\_auto\_rotate) | Whether to enable automatic KMS key rotation. Defaults to true. | `bool` | `true` | no |
| <a name="input_deletion_window_in_days"></a> [deletion\_window\_in\_days](#input\_deletion\_window\_in\_days) | Duration (in days) to wait before deleting a key that is scheduled for deletion. Defaults to 10 days. | `number` | `10` | no |
| <a name="input_description"></a> [description](#input\_description) | The KMS key description. | `string` | `""` | no |
| <a name="input_policy"></a> [policy](#input\_policy) | A valid policy JSON document to attach to the key. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_alias"></a> [alias](#output\_alias) | n/a |
| <a name="output_arn"></a> [arn](#output\_arn) | n/a |
| <a name="output_key_id"></a> [key\_id](#output\_key\_id) | n/a |
<!-- END_TF_DOCS -->
