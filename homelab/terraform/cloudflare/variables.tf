variable "cf_zone_id" {
  type = string
  description = "The Cloudflare Zone ID."
}

variable "private_ip" {
  type = string
  description = "the private IP address for DNS to map the domain to."
}
