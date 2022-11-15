# Homelab

## Proxmox Server

### Install instructions

1.  Name the node
2.  Choose the VLAN

### Post-Install Instructions

0.  Dark Mode
    1.  https://github.com/Weilbyte/PVEDiscordDark
    2.  bash <(curl -s https://raw.githubusercontent.com/Weilbyte/PVEDiscordDark/master/PVEDiscordDark.sh ) install
1.  Disk (set up LVM and ZFS)
2.  Create `packer` and `terraform` Users/Tokens/Permissions
    1.  Create User
    2.  Create API Token
        1.  UNCHECK "privilege separation"
    3.  Create User and API Token Permissios (Administrator)
        1.  propagate "true"
