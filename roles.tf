resource "aws_iam_role" "lambda_role_for_dynamaDB" {
  name = "Lambda_role_for_event_management"
  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : [
          "sts:AssumeRole"
        ],
        "Principal" : {
          "Service" : [
            "lambda.amazonaws.com"
          ]
        }
      }
    ]
  })
}

resource "aws_iam_role_policy" "DynamoDB_Full_Access" {
  name = "DynamoDB_Full_Access"
  role = aws_iam_role.lambda_role_for_dynamaDB.id
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : [
          "dynamodb:PutItem",       # For adding events to DynamoDB
          "dynamodb:Query",         # To allow querying the table if needed in future
          "dynamodb:GetItem",       # Optional, if the Lambda will fetch items
          "dynamodb:BatchWriteItem" # Optional, if batch operations are needed
        ],
        "Resource" : "*"
      }
    ]
  })
}
