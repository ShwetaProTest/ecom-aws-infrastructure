resource "aws_api_gateway_rest_api" "ecom_api" {
  name        = "ecom-user-behavior-api"
  description = "API for capturing e-commerce user behavior"
  endpoint_configuration {
    types = ["REGIONAL"]
  }
}

output "api_id" {
  value = aws_api_gateway_rest_api.ecom_api.id
}

output "api_arn" {
  value = aws_api_gateway_rest_api.ecom_api.arn
}

output "root_resource_id" {
  value = aws_api_gateway_rest_api.ecom_api.root_resource_id
}
