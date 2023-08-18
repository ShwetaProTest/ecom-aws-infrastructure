resource "aws_s3_bucket" "processed_bucket" {
  bucket = var.PROCESSED_S3_BUCKET_NAME
  acl    = "private"
}