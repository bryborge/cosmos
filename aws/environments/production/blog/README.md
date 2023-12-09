# Blog

Creates all of the infrastructure for my personal blog, and the Github CI/CD action used to deploy it.

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.67.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_s3_bucket_site"></a> [s3\_bucket\_site](#module\_s3\_bucket\_site) | ../../../modules/s3-bucket-site | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_iam_access_key.blog_gh_cicd](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_access_key) | resource |
| [aws_iam_user.blog_gh_cicd](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user) | resource |
| [aws_iam_user_policy.blog_gh_cicd](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_policy) | resource |
| [aws_iam_policy_document.blog_gh_cicd](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_account_id"></a> [aws\_account\_id](#input\_aws\_account\_id) | The AWS account to deploy to. | `string` | n/a | yes |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | The AWS region this is hosted in. | `string` | n/a | yes |
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name) | The name of the s3 bucket. | `string` | n/a | yes |
| <a name="input_cloudfront_dist_id"></a> [cloudfront\_dist\_id](#input\_cloudfront\_dist\_id) | The cloudfront distribution ID. | `string` | n/a | yes |
| <a name="input_cloudfront_price_class"></a> [cloudfront\_price\_class](#input\_cloudfront\_price\_class) | The price class for the cloudfront distribution. | `string` | n/a | yes |
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | The domain name. | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment to deploy to. | `string` | n/a | yes |
| <a name="input_error_html"></a> [error\_html](#input\_error\_html) | The name of the object key when a 4XX class error occurs (e.g., '404.html'). | `string` | n/a | yes |
| <a name="input_index_html"></a> [index\_html](#input\_index\_html) | The name of the index document to serve as a static site (e.g., 'index.html'). | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
