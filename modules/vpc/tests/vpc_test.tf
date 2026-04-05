terraform {
  required_version = ">= 1.5"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region                        = "eu-central-1"
  access_key                    = "test"
  secret_key                    = "test"
  skip_credentials_validation   = true
  skip_metadata_api_check       = true
  skip_requesting_account_id    = true
  skip_get_ec2_platforms        = true
}

module "vpc" {
  source             = ".."
  env                = "test"
  az                 = "eu-central-1a"
  vpc_cidr           = "10.0.0.0/16"
  public_subnet_cidr = "10.0.1.0/24"
}

# test "vpc module exposes an id" {
#   condition = module.vpc.vpc_id != ""
# }

# test "vpc module exposes a public subnet id" {
#   condition = module.vpc.public_subnet_id != ""
# }
