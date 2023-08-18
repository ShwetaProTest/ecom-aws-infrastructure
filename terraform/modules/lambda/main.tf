resource "aws_lambda_function" "user_behavior_processor" {
  function_name    = "userBehaviorProcessor"
  handler          = "main.handler"  
  runtime          = "python3.8"
  role             = aws_iam_role.lambda_execution_role.arn
  filename         = "../../lambdas/preprocessing.zip"
  
  environment {
    variables = {
      KINESIS_STREAM_NAME = var.kinesis_stream_name
      reserved_concurrent_executions = var.lambda_reserved_concurrency
      subnet_ids         = var.subnet_ids
      security_group_ids = var.security_group_ids
      memory_size = var.lambda_memory_size
    }
  }
}

resource "aws_iam_role" "lambda_execution_role" {
  name = "lambda_execution_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Principal = {
          Service = "lambda.amazonaws.com"
        },
        Effect = "Allow",
        Sid    = ""
      }
    ]
  })
}

resource "aws_api_gateway_integration" "lambda_integration" {
  rest_api_id = var.api_id
  resource_id = var.api_root_resource_id
  http_method = "POST"
  type        = "AWS_PROXY"
  uri         = aws_lambda_function.user_behavior_processor.invoke_arn
}

resource "aws_lambda_permission" "apigw" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.user_behavior_processor.function_name
  principal     = "apigateway.amazonaws.com"
}

resource "aws_appautoscaling_target" "lambda" {
  max_capacity       = var.lambda_max_concurrency
  min_capacity       = var.lambda_min_concurrency
  resource_id        = "function:${aws_lambda_function.user_behavior_processor.function_name}"
  scalable_dimension = "lambda:function:ProvisionedConcurrency"
  service_namespace  = "lambda"
}