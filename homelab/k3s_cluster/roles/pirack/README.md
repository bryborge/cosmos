# Pirack

Provisions the UCTRONICS Pi Rack Pro display and power button for Raspberry Pi hosts running Ubuntu.

## Requirements

None.

## Role Variables

*   `primary_user` - The primary user on the system
*   `github_account` - The github account where the UCTRONICS code lives

## Dependencies

None.

## Example Playbook

```yml
  - hosts: servers
    roles:
      - pirack
```

## License

MIT
