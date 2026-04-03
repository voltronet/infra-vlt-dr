resource "aws_s3_bucket" "app_assets" {
  bucket = "drcarmen-assets-${var.env}-${var.random_id}"
}

resource "aws_s3_bucket_public_access_block" "block_public" {
  bucket = aws_s3_bucket.app_assets.id
  block_public_acls = true
  block_public_policy = true
}