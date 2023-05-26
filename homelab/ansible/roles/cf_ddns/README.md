# Cloudflare DDNS

Sets up and enables the Cloudflare DDNS updater service.

## Requirements

In order for the Cloudflare DDNS updater service to function properly, you must
first decrypt the `vars/main.yml` file before running the ansible playbook.

## Role Variables

*   `github_account` - The Github account where the cloudflare-ddns code lives
*   `github_branch` - The Github branch for the cloudflare-ddns repository
*   `primary_user` - The primary user on the system
*   `cf_api_token` - The Cloudflare API Token _(secret)_
*   `cf_zone_id` - The Cloudflare Zone ID _(secret)_

## Dependencies

The following dependencies are for encryption/decryption of secret vars.

*   [SOPS (Secrets OPerationS)](https://github.com/mozilla/sops)
*   [age](https://github.com/FiloSottile/age)

## Example Playbook

```yml
- hosts: servers
  roles:
    - cf_ddns
```

## License

MIT
