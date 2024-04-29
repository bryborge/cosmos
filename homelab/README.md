# 🏠🧪 Homelab

All the Infrastructure as Code (IaC) for my Homelab lives here.

## 📋 Overview

### 💽 Software

*   Kubernetes Cluster - [K3s](https://k3s.io/)
*   3D Printer Server - [Octoprint](https://octoprint.org/)
*   NAS Server - [TrueNAS SCALE](https://www.truenas.com/truenas-scale/)

### ⚙️ Hardware

*   K3s cluster
    *   Raspberry Pi 4, 8gb model
    *   **SSD:** 250gb (system / storage)
*   Octoprint server
    *   Raspberry Pi 4, 2gb model
*   TrueNAS Server
    *   **CPU:** 4 Cores / 8 Threads (i7-4790k)
    *   **MEM:** 32GB DDR3
    *   **SSD:** 250GB (system)
    *   **SSD:** 500GB (general host storage)
    *   **HDD:** 4x 8TB (RAIDZ2)

## 🥧 Raspberry Pi Systems

I have several Raspberry Pis deployed throughout my Homelab running a variety of workloads. In order to simplify the
management of these systems, I use the same operating system installed using the same imager software and settings
whenever possible. This provides a reliable/repeatable baseline by which I can provision the systems with Ansible.

### Software Used

*   [Ubuntu Server 22.04 LTS (Jammy Jellyfish)](https://releases.ubuntu.com/jammy/)
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

## TrueNAS SCALE

The home for all-things "data" in my homelab. Here are some reasons I chose this platform:

*   Debian-based OS
*   Rich "app" ecosystem ([Truecharts](https://truecharts.org/))
*   Several virtualization options
    *   Can run and manage VMs
    *   Apps are hosted in a kubernetes environment (K3s) on the system

### General Setup

After installing the OS, here are the things I like to do to setup and manage the system.

1.  Enable MFA
2.  Create non-privileged user(s)
3.  Create and/or Import Storage Pools
4.  Create the Datasets
5.  Create SMB and NFS shares
    1.  Modify ACLs for these shares
6.  Configure Data Protection
    1.  Scrub tasks on each pool
    2.  Periodic snapshot tasks
    3.  SMART tests
7.  Add the Truecharts catalog
    1.  https://github.com/truecharts/catalog
8.  Move TrueNAS UI to be served on ports 81 and 444
9.  Install and configure Traefik or Nginx Proxy Manager
10. Point DNS to *local* IP address (as I do NOT want to make this server accessible to the public internet but I DO want to use my own domain name)

## 🧠 Additional Materials

*   [Enable SSH on Raspberry Pi when you flash the SD card](https://roboticsbackend.com/enable-ssh-on-raspberry-pi-raspbian/#New_feature_Enable_SSH_directly_when_you_flash_the_SD_card)
