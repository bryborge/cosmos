# Homelab

## Raspberry Pi

1.  Flash latest Ubuntu LTS (64bit) ARM-based image onto sd card - 16GiB or larger. Use the
    [Raspberry Pi Imager](https://www.raspberrypi.com/software/). And select the following options.
    1.  Set hostname: `<hostname>`.local
    2.  Enable SSH: Allow public-key authentication only
        1.  Set authorization for: `<contents_of_public_key_file>`
    3.  Set locale settings
        1.  Timezone: `America/Los_Angeles`
        2.  Keyboard layout: `us`
    4.  Eject Media when Finished
    5.  Enable Telemetry
2.  Insert newly flashed drive into the raspberry pi and power on. Give it 1-2 minutes to boot.
3.  Test SSH connection: `ssh <username>@<hostname>`

## Ansible
