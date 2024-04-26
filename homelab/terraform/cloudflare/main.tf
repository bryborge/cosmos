# Create "A" record
resource "cloudflare_record" "bryborge_cloud" {
  zone_id = var.cf_zone_id
  name    = "bryborge.cloud"
  value   = var.private_ip # private, because I only want my services accessible locally (or via teleport)
  type    = "A"
  proxied = false
}
