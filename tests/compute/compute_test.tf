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
}

module "compute" {
  source        = "../../modules/compute"
  env           = "test"
  vpc_id        = "vpc-0123456789abcdef0"
  subnet_id     = "subnet-0123456789abcdef0"
  bucket_arn    = "arn:aws:s3:::drcarmen-assets-test-123"
  my_ip         = "1.2.3.4"
  key_name      = "dummy-key"
  deploy_ecs    = false
  instance_type = "t3.micro"
}
