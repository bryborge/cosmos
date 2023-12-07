# Primary (`default`) KMS Key

Creates the primary KMS key with the default policy.

## Prerequisites

*   [Secret OPerationS (sops)](https://github.com/getsops/sops) - An editor of encrypted files that supports YAML, JSON,
    ENV, INI and BINARY formats and encrypts with AWS KMS, GCP KMS, Azure Key Vault, age, and PGP.

## SOPS Example Usage

```sh
KMS_ARN="arn:aws:kms:us-west-2:$(aws sts get-caller-identity --query 'Account' --output text):alias/primary"
sops --kms $(echo $KMS_ARN) <FILE_TO_EDIT>
```

## Deployment

```bash
terragrunt init
terragrunt apply
```

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_kms"></a> [kms](#module\_kms) | ../../../../modules/kms | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | The AWS region this is hosted in. | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
