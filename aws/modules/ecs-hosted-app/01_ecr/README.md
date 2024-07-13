# ECS-Hosted App (ECR)

This is the first of two steps that provisions the infrastructure resources for an application (via Docker image)
running on ECS.

## Prerequisites

*   A tagged Docker image ready to push to ECR (once `01_ecr` is run and an ECR exists to push to)

## Deployment

```bash
terragrunt init
terragrunt apply
```

## Post-Deployment

1.  Authenticate AWS/Docker

    ```bash
    aws ecr get-login-password --region us-west-2 | docker login --username AWS --password-stdin 388372205874.dkr.ecr.us-west-2.amazonaws.com
    ```

2.  Tag your image (if you haven't already).

    ```bash
    docker tag my-app:latest 1234567890123.dkr.ecr.us-west-2.amazonaws.com/my-app:latest
    ```

    **Note:** Change `my-app`, the AWS Account Number and Region in the command below (don't copy/paste).

3.  Push the image to the newly-provisioned ECR

    ```bash
    docker push 1234567890123.dkr.ecr.us-west-2.amazonaws.com/my-app:latest
    ```

    **Note:** Change `my-app`, the AWS Account Number and Region in the command below (don't copy/paste).

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
| [aws_ecr_repository.image](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_account_id"></a> [aws\_account\_id](#input\_aws\_account\_id) | The AWS account to deploy to. | `string` | n/a | yes |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | The AWS region this is hosted in. | `string` | n/a | yes |
| <a name="input_ecr_repo_name"></a> [ecr\_repo\_name](#input\_ecr\_repo\_name) | The name of the ECR repository. | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment to deploy to. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ecr_repository_url"></a> [ecr\_repository\_url](#output\_ecr\_repository\_url) | n/a |
<!-- END_TF_DOCS -->
