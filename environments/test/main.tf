# environments/test/main.tf

terraform {
  required_providers {
    aws        = { source = "hashicorp/aws", version = "~> 5.0" }
    #cloudflare = { source = "cloudflare/cloudflare", version = "~> 4.0" }
  }
}

provider "aws" {
  region  = "eu-central-1"
  #profile = "airimus"
  assume_role {
    role_arn     = "arn:aws:iam::995487091999:role/stsAsumeRoleCopilot"
    session_name = "TerraformDrCarmenDeployment"
  }
}

# provider "cloudflare" {
#   api_token = var.cloudflare_token
# }

# VERIFICĂ DACĂ AI ACESTE BLOCURI ȘI DACĂ AU CONȚINUT:

module "vpc" {
  source             = "../../modules/vpc"
  env                = "test"
  az                 = "eu-central-1a"
  vpc_cidr           = "10.0.0.0/16"
  public_subnet_cidr = "10.0.1.0/24"
}

module "storage" {
  source    = "../../modules/storage"
  env       = "test"
  random_id = "adrian-v1"
}

module "compute" {
  source        = "../../modules/compute"
  env           = "test"
  vpc_id        = module.vpc.vpc_id
  subnet_id     = module.vpc.public_subnet_id
  bucket_arn    = module.storage.bucket_arn
  my_ip         = var.my_ip_address
  key_name      = var.ssh_key_name
  deploy_ecs    = var.deploy_ecs
  instance_type = "t3.small"
}

# resource "cloudflare_record" "app_dns" {
#   zone_id = var.cloudflare_zone_id
#   name    = "staging"
#   value   = var.deploy_ecs ? "127.0.0.1" : module.compute.server_public_ip
#   type    = "A"
#   proxied = true
# }