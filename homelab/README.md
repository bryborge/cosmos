# 🏠🧪 Homelab

## 📋 Overview

### 💽 Software

*   Kubernetes Cluster - [Talos Linux](https://www.talos.dev/)
*   NAS Server - [TrueNAS SCALE](https://www.truenas.com/truenas-scale/)

### ⚙️ Hardware

*   Talos cluster
    *   Raspberry Pi 4, 8gb model
    *   **SSD:** 250gb (system / storage)
*   TrueNAS Server
    *   **CPU:** 4 Cores / 8 Threads (i7-4790k)
    *   **MEM:** 32GB DDR3
    *   **SSD:** 250GB (system)
    *   **SSD:** 500GB (general host storage)
    *   **HDD:** 4x 8TB (RAIDZ2)

## 🥧 Raspberry Pi Cluster

### Software Used

*   [Talos Linux](https://www.talos.dev/)
*   [Talos Image Factory](https://factory.talos.dev/)
*   [Raspberry Pi Imager](https://www.raspberrypi.com/software/)

### Setup

1.  TODO: Add setup steps for Talos Linux image creation, installation, and
          remote management.

## TrueNAS SCALE

The home for all-things "data" in my homelab. Here are some reasons I chose this
platform:

*   Debian-based OS
*   Several virtualization options
    *   Can run and manage VMs
    *   Apps are hosted in a kubernetes environment (k3s) on the system

### Setup

After installing the OS, here are the things I like to do to setup and manage
the system.

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

## 🧠 Additional Materials

*   [Enable SSH on Raspberry Pi when you flash the SD card](https://roboticsbackend.com/enable-ssh-on-raspberry-pi-raspbian/#New_feature_Enable_SSH_directly_when_you_flash_the_SD_card)
