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
