resource "aws_dynamodb_table" "database" {
  name         = "event_management"
  hash_key     = "event_id"
  billing_mode = "PAY_PER_REQUEST"


  attribute {
    name = "event_id"
    type = "N"
  }
}

resource "aws_lambda_function" "lambda" {
  function_name = "event_management_registration"
  description   = "This lambda function will be used to communicate between API Gateway and backend"
  role          = aws_iam_role.lambda_role_for_dynamaDB.arn
  runtime       = "python3.13"
  handler       = "lambda_function.lambda_handler"
  filename      = data.archive_file.lambda_zip.output_path

}

resource "aws_lambda_permission" "allow_api_gateway" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  principal     = "apigateway.amazonaws.com"
  function_name = aws_lambda_function.lambda.function_name
}
