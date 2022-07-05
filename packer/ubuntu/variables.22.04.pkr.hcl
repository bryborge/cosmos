variable "ubuntu_version" {
  default = "22.04"
}

locals {
  ubuntu_2204_iso_url      = "https://releases.ubuntu.com/jammy/ubuntu-${var.ubuntu_version}-live-server-amd64.iso"
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
