# Cloudflare DDNS

Sets up and enables the Cloudflare DDNS updater service.

## Requirements

None.

## Role Variables

*   `github_account` - The Github account where the cloudflare-ddns code lives
*   `github_branch` - The Github branch for the cloudflare-ddns repository
*   `primary_user` - The primary user on the system
*   `cf_api_token` - The Cloudflare API Token
*   `cf_zone_id` - The Cloudflare Zone ID

## Dependencies

None.

## Example Playbook

```yml
- hosts: servers
  vars_prompt:
    - name: cf_api_token
      prompt: Enter Cloudflare API Token
    - name: cf_zone_id
      prompt: Enter Cloudflare Zone ID
  roles:
    - cf_ddns
```

## License

MIT
