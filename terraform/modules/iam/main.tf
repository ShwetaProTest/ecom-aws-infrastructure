resource "aws_iam_role" "firehose_role" {
  name = "firehose_delivery_role"
  
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Principal = {
          Service = "firehose.amazonaws.com"
        },
        Effect = "Allow",
        Sid    = ""
      }
    ]
  })
}

resource "aws_iam_role_policy" "firehose_s3" {
  name   = "FirehoseToS3Policy"
  role   = aws_iam_role.firehose_role.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = [
          "s3:PutObject",
          "s3:GetObject",
          "s3:ListBucket"
        ],
        Resource = [
          "${aws_s3_bucket.raw_bucket.arn}/*",
          aws_s3_bucket.raw_bucket.arn
        ],
        Effect = "Allow"
      }
    ]
  })
}
