resource "aws_sagemaker_notebook_instance" "sagemaker_instance" {
  name          = var.SAGEMAKER_INSTANCE_NAME
  role_arn      = var.SAGEMAKER_ROLE_ARN
  instance_type = var.SAGEMAKER_INSTANCE_TYPE
}