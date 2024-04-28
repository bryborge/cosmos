# Cloudflare

Creates the DNS record(s) for my Homelab associated with my domain name(s) registered with Cloudflare.

## SOPs (w/ Age)

### Edit Encrypted File

*   Decrypt it (in-place):

    ```sh
    sops --decrypt --in-place terraform.tfvars.enc
    ```

*   Make whatever edits you need.

*   Encrypt it (in-place):

    ```sh
    sops --encrypt --in-place terraform.tfvars.enc
    ```

## Deployment

```sh
sops --decrypt terraform.tfvars.enc > decrypted.tfvars
terraform apply -var-file decrypted.tfvars
rm decrypted.tfvars
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_cloudflare"></a> [cloudflare](#requirement\_cloudflare) | ~> 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_cloudflare"></a> [cloudflare](#provider\_cloudflare) | 3.35.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [cloudflare_record.bryborge_cloud_a](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/record) | resource |
| [cloudflare_record.bryborge_cloud_cname](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/record) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cf_zone_id"></a> [cf\_zone\_id](#input\_cf\_zone\_id) | The Cloudflare Zone ID. | `string` | n/a | yes |
| <a name="input_private_ip"></a> [private\_ip](#input\_private\_ip) | the private IP address for DNS to map the domain to. | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
