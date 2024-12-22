data "archive_file" "lambda_zip" {
  type        = "zip"
  source_file = "./lambda/lambda_function.py"
  output_path = "lambda/lambda_function.zip"
}
