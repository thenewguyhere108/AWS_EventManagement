module "api_gateway" {
  source  = "terraform-aws-modules/apigateway-v2/aws"
  version = "5.2.1"

  name          = "event-api"
  description   = "Event API Gateway"
  protocol_type = "HTTP"

  create_domain_name        = false
  stage_access_log_settings = null

  cors_configuration = {
    allow_headers  = ["*"]
    allow_methods  = ["*"]
    allow_origins  = ["*"]
    expose_headers = ["*"]
    max_age        = 3600
  }

  routes = {
    "POST /register" = {
      integration = {
        type                   = "AWS_PROXY"
        uri                    = aws_lambda_function.lambda.invoke_arn
        integration_method     = "POST"
        payload_format_version = "2.0"
      }
    }
  }
}
