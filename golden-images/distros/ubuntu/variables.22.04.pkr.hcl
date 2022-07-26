locals {
  ubuntu_2204_base_ami     = "ami-005414fb846dc12d1"
  ubuntu_2204_iso_url      = "https://releases.ubuntu.com/jammy/ubuntu-22.04-live-server-amd64.iso"
  ubuntu_2204_iso_checksum = "84aeaf7823c8c61baa0ae862d0a06b03409394800000b3235854a6b38eb4856f"
  ubuntu_2204_boot_command = [
    "<esc><wait>",
    "e<wait>",
    "<down><down><down><end>",
    "<bs><bs><bs><bs><wait>",
    "autoinstall ds=nocloud-net\\;s=http://{{ .HTTPIP }}:{{ .HTTPPort }}/ ---<wait>",
    "<f10><wait>"
  ]
}
