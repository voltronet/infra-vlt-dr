terraform {
  required_version = ">= 1.7"
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

module "storage" {
  source    = "../../modules/storage"
  env       = "test"
  random_id = "unit-test-1"
}

test "storage module exposes a bucket name" {
  condition = module.storage.bucket_name != ""
}

test "storage module exposes a bucket ARN" {
  condition = contains(module.storage.bucket_arn, "arn:aws:s3")
}
