variable "my_ip_address" {
  type = string
}

variable "ssh_key_name" {
  type = string
}

# variable "cloudflare_token" {
#   type      = string
#   sensitive = true
# }

# variable "cloudflare_zone_id" {
#   type = string
# }

variable "deploy_ecs" {
  type    = bool
  default = false
}

variable "keep_ec2_during_migration" {
  type    = bool
  default = false
}