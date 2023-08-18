resource "aws_kinesis_stream" "data_stream" {
  name             = "data-stream"
  shard_count      = 1
}

resource "aws_kinesis_firehose_delivery_stream" "firehose_to_s3" {
  name        = "kinesis-firehose-stream"
  destination = "s3"

  s3_configuration {
    role_arn           = aws_iam_role.firehose_role.arn
    bucket_arn         = aws_s3_bucket.raw_bucket.arn
  }
}
