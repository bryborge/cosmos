# Pirack

Setup UCTRONICS Pi Rack Pro electronics and SSDs for Raspberry Pi hosts.

## Requirements

*   [UCTRONICS Pi Rack Pro](https://www.uctronics.com/uctronics-pi-rack-pro-for-raspberry-pi-4b-19-1u-rack-mount-support-for-4-2-5-ssds.html)
*   [Raspberry Pi](https://www.raspberrypi.com/)
*   An SSD drive connected to each Raspberry Pi

## Role Variables

*   `github_account` - The github account where the UCTRONICS code lives
*   `volume_label` - The SSD volume label to mount

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
