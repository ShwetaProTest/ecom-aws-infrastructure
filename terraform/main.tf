provider "aws" {
  region      = "us-east-1"  # Adjust based on your preferred AWS region
  access_key  = var.AWS_ACCESS_KEY
  secret_key  = var.AWS_SECRET_KEY
}

module "api_gateway" {
  source = "./modules/api-gateway"
}

module "lambda" {
  source             = "./modules/lambda"
  api_id             = module.api_gateway.api_id
  api_arn            = module.api_gateway.api_arn
  api_root_resource_id = module.api_gateway.root_resource_id
  kinesis_stream     = aws_kinesis_stream.data_stream.name
  s3_bucket          = aws_s3_bucket.raw_bucket.bucket
}

resource "aws_s3_bucket" "raw_bucket" {
  bucket = var.RAW_S3_BUCKET_PATH
  acl    = "private"
}

resource "aws_kinesis_stream" "data_stream" {
  name             = var.KINESIS_STREAM_NAME
  shard_count      = 1
}

resource "aws_glue_catalog_database" "my_db" {
  name = var.GLUE_DATABASE_NAME
}

resource "aws_glue_crawler" "my_crawler" {
  database_name = aws_glue_catalog_database.my_db.name
  name          = var.GLUE_CRAWLER_NAME
  role          = var.GLUE_IAM_ROLE
  s3_target {
    path = aws_s3_bucket.raw_bucket.bucket
  }
}

resource "aws_redshift_cluster" "default" {
  cluster_identifier = var.REDSHIFT_CLUSTER_ID
  database_name      = var.REDSHIFT_DB_NAME
  master_username    = var.REDSHIFT_MASTER_USERNAME
  master_password    = var.REDSHIFT_MASTER_PASSWORD
  node_type          = var.REDSHIFT_NODE_TYPE
  cluster_type       = var.REDSHIFT_CLUSTER_TYPE
}

resource "aws_sagemaker_notebook_instance" "sagemaker_instance" {
  name          = var.SAGEMAKER_INSTANCE_NAME
  role_arn      = var.SAGEMAKER_ROLE_ARN
  instance_type = var.SAGEMAKER_INSTANCE_TYPE
}

resource "aws_s3_bucket" "processed_bucket" {
  bucket = var.PROCESSED_S3_BUCKET_NAME
  acl    = "private"
}
