# Cloudflare

Creates the DNS record(s) for my Homelab associated with my domain name(s) registered with Cloudflare.

## Deployment

```sh
sops --decrypt terraform.tfvars.enc > decrypted.tfvars
terraform apply -var-file decrypted.tfvars
rm decrypted.tfvars
```

<!-- TODO: CI/CD

```sh
sops --decrypt .env.enc > .env
export $(cat .env | xargs)
rm .env
terraform apply
``` -->
