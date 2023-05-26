# Cloudflare DDNS

Sets up and enables the Cloudflare DDNS updater service.

## Requirements

In order for the Cloudflare DDNS updater service to function properly, it needs
the decrypted values stored in `vars/secrets.sops.yml`. This file (and the
values stored within) are decrypted at runtime using `community.sops.load_vars`.

For more information about protecting Ansible secrets with SOPS, check out
[Ansible's Documentation](https://docs.ansible.com/ansible/latest/collections/community/sops/docsite/guide.html)
on the topic.

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
