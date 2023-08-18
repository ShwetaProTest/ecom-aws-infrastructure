resource "aws_glue_catalog_database" "my_db" {
  name = var.GLUE_DATABASE_NAME
}

resource "aws_glue_crawler" "my_crawler" {
  database_name = aws_glue_catalog_database.my_db.name
  name          = var.GLUE_CRAWLER_NAME
  role          = var.GLUE_IAM_ROLE
  s3_target {
    path = var.RAW_S3_BUCKET_PATH
  }
}