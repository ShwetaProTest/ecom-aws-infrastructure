variable "AWS_ACCESS_KEY" {
  description = "AWS access key"
}

variable "AWS_SECRET_KEY" {
  description = "AWS secret key"
}

variable "KINESIS_STREAM_NAME" {
  description = "Name of the Kinesis stream to which the Lambda sends preprocessed events"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for the Lambda function"
  type        = list(string)
}

variable "security_group_ids" {
  description = "List of security group IDs for the Lambda function"
  type        = list(string)
}

variable "lambda_memory_size" {
  description = "Amount of memory in MB allocated to the Lambda function"
  default     = 128
}

variable "lambda_reserved_concurrency" {
  description = "Number of reserved concurrent executions for the Lambda function"
  default     = 10
}

variable "lambda_min_concurrency" {
  description = "Minimum number of reserved concurrent executions for the Lambda function"
  default     = 5
}

variable "lambda_max_concurrency" {
  description = "Maximum number of reserved concurrent executions for the Lambda function"
  default     = 50
}

# For Glue
variable "GLUE_DATABASE_NAME" {
  description = "Name of the Glue database"
  type        = string
}

variable "GLUE_CRAWLER_NAME" {
  description = "Name of the Glue crawler"
  type        = string
}

variable "GLUE_IAM_ROLE" {
  description = "IAM Role for Glue"
  type        = string
}

variable "RAW_S3_BUCKET_PATH" {
  description = "Path for the raw data in S3"
  type        = string
}

# For Redshift
variable "REDSHIFT_CLUSTER_ID" {
  description = "Cluster ID for Redshift"
  type        = string
}

variable "REDSHIFT_DB_NAME" {
  description = "Database name for Redshift"
  type        = string
}

variable "REDSHIFT_MASTER_USERNAME" {
  description = "Master username for Redshift"
  type        = string
}

variable "REDSHIFT_MASTER_PASSWORD" {
  description = "Master password for Redshift"
  type        = string
  sensitive   = true
}

variable "REDSHIFT_NODE_TYPE" {
  description = "Node type for Redshift"
  type        = string
}

variable "REDSHIFT_CLUSTER_TYPE" {
  description = "Cluster type for Redshift"
  type        = string
}

# For SageMaker
variable "SAGEMAKER_INSTANCE_NAME" {
  description = "Instance name for SageMaker"
  type        = string
}

variable "SAGEMAKER_ROLE_ARN" {
  description = "Role ARN for SageMaker"
  type        = string
}

variable "SAGEMAKER_INSTANCE_TYPE" {
  description = "Instance type for SageMaker"
  type        = string
}

# For processed data in S3
variable "PROCESSED_S3_BUCKET_NAME" {
  description = "Bucket name for processed data in S3"
  type        = string
}