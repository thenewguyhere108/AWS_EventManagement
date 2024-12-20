resource "aws_dynamodb_table" "event_management" {
  name         = "event_management"
  hash_key     = "event_id"
  billing_mode = "PAY_PER_REQUEST"

  attribute {
    name = "event_id"
    type = "N"
  }

}
