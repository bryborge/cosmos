# Terraform

TODO: Provide more detail on what Ansible is used for, why I've chosen it for this part of my IT management, etc.

## Useful commands

*   Encrypt a secrets file called `secrets.sops.yml`

    ```sh
    sops \
        --encrypt \
        --age <age-key> \
        --encrypted-regex '^(cf_api_token|cf_zone_id)$' \
        --in-place secrets.sops.yml
    ```

*   Decrypt a secrets file called `secrets.sops.yml`

    ```sh
    sops \
        --decrypt \
        --age <age-key> \
        --encrypted-regex '^(cf_api_token|cf_zone_id)$' \
        --in-place secrets.sops.yml
    ```
