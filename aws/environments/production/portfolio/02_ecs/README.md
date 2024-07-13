# Portfolio (ECS)

Creates the Elastic Container Service (ECS) infrastructure necessary to host the portfolio app on ECS.

## Prerequisites

*   Default AWS VPC
*   Default AWS Subnets
*   An Elastic Container Registry
*   A tagged Docker image located on ECR

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_portfolio_app"></a> [portfolio\_app](#module\_portfolio\_app) | ../../../../modules/ecs-hosted-app/02_ecs | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_name"></a> [app\_name](#input\_app\_name) | The name of the application. | `string` | n/a | yes |
| <a name="input_app_port"></a> [app\_port](#input\_app\_port) | The port the application listens on. | `number` | n/a | yes |
| <a name="input_aws_account_id"></a> [aws\_account\_id](#input\_aws\_account\_id) | The AWS account to deploy to. | `string` | n/a | yes |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | The AWS region this is hosted in. | `string` | n/a | yes |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | ECS Cluster Name. | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment to deploy to. | `string` | n/a | yes |
| <a name="input_image_tag"></a> [image\_tag](#input\_image\_tag) | The name of the Docker image tag. | `string` | n/a | yes |
| <a name="input_service_count"></a> [service\_count](#input\_service\_count) | The number of services to deploy. | `number` | `1` | no |
| <a name="input_task_execution_name"></a> [task\_execution\_name](#input\_task\_execution\_name) | ECS task execution name. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_portfolio_lb_dns"></a> [portfolio\_lb\_dns](#output\_portfolio\_lb\_dns) | AWS load balancer DNS Name |
<!-- END_TF_DOCS -->
