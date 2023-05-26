# 🏠🧪 Homelab

This is where all Infrastructure as Code (IaC) for my Homelab lives.

## 🔧 Tooling

*   [Ansible](https://www.ansible.com/) - a radically simple IT automation platform that makes your applications and
    systems easier to deploy and maintain.
*   [Secrets OPerationS (SOPS)](https://github.com/mozilla/sops) - Simple and flexible tool for managing secrets.
*   [age](https://github.com/FiloSottile/age) - A simple, modern and secure encryption tool (and Go library) with small
    explicit keys, no config options, and UNIX-style composability.

## Ansible

### Useful commands

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


## 🥧 Raspberry Pi Systems

I have several Raspberry Pis deployed throughout my Homelab running a variety of workloads. In order to simplify the
management of these systems, I use the same operating system installed using the same imager software and settings
whenever possible. This provides a reliable/repeatable baseline by which I can provision the systems with Ansible.

### Current Software Used

*   [Ubuntu 22.04 LTS (Jammy Jellyfish)](https://releases.ubuntu.com/jammy/)
*   [Raspberry Pi Imager](https://www.raspberrypi.com/software/)

### Setup

1.  Flash latest Ubuntu LTS (64bit) ARM-based image onto sd card - 16GiB or larger. Use the
    [Raspberry Pi Imager](https://www.raspberrypi.com/software/). Choose the following options.
    1.  Set hostname: `<hostname>.local`
    2.  Enable SSH: `Allow public-key authentication only`
        1.  Set authorization for: `<contents_of_public_key_file>`
    3.  Set username and password:
        1.  Username: `<username>`
        2.  Password: `<password>`
    4.  Configure wireless LAN _(only if necessary)_:
        1.  SSID: `<Wifi Name>`
            1.  Hidden SSID: `true`
        2.  Password: `<Wifi Password>`
    5.  Set locale settings:
        1.  Timezone: `America/Los_Angeles`
        2.  Keyboard layout: `us`
    6.  Eject Media when Finished
    7.  Enable Telemetry
2.  Insert newly flashed drive into the raspberry pi and power on. Give it 1-2 minutes to boot.
3.  Test SSH connection: `ssh <username>@<hostname>`

## Resources

*   [Enable SSH on Raspberry Pi when you flash the SD card](https://roboticsbackend.com/enable-ssh-on-raspberry-pi-raspbian/#New_feature_Enable_SSH_directly_when_you_flash_the_SD_card)
