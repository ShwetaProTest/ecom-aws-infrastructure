provider "aws" {
  version = "~> 3.0"
  region  = var.aws_region
  access_key  = var.AWS_ACCESS_KEY
  secret_key  = var.AWS_SECRET_KEY
}
