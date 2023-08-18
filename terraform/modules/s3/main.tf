resource "aws_s3_bucket" "raw_bucket" {
  bucket = "bucket name"
  acl    = "private"
}