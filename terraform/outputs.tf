# API Gateway
output "api_gateway_endpoint" {
  description = "The endpoint URL of the deployed API Gateway"
  value       = module.api_gateway.endpoint_url  # Assumes your api-gateway module provides this output.
}

# Lambda
output "lambda_function_arn" {
  description = "ARN of the Lambda function used for preprocessing"
  value       = module.lambda.lambda_arn  # Assumes your lambda module provides this output.
}

# S3 Buckets
output "raw_data_s3_bucket" {
  description = "The name of the raw data S3 bucket"
  value       = aws_s3_bucket.raw_bucket.bucket
}

output "processed_data_s3_bucket" {
  description = "The name of the processed data S3 bucket"
  value       = aws_s3_bucket.processed_bucket.bucket
}

# Kinesis
output "kinesis_stream_arn" {
  description = "The ARN of the Kinesis Data Stream"
  value       = aws_kinesis_stream.data_stream.arn
}

# AWS Glue
output "glue_catalog_database_name" {
  description = "The name of the AWS Glue catalog database"
  value       = aws_glue_catalog_database.my_db.name
}

output "glue_crawler_name" {
  description = "The name of the AWS Glue crawler"
  value       = aws_glue_crawler.my_crawler.name
}

# Redshift
output "redshift_cluster_endpoint" {
  description = "The endpoint for the Redshift cluster"
  value       = aws_redshift_cluster.default.endpoint
}

# SageMaker
output "sagemaker_notebook_instance_url" {
  description = "URL of the SageMaker Notebook instance"
  value       = aws_sagemaker_notebook_instance.sagemaker_instance.url  # Assumes SageMaker resource provides a URL attribute.
}