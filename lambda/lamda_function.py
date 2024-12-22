import boto3
import json

# Initialize DynamoDB resource outside the handler
dynamodb = boto3.resource("dynamodb")
event_table = dynamodb.Table("event_management")

def lambda_handler(event, context):
    try:
        # Parse and validate the incoming event JSON
        receivedEventID = int(event.get("eid"))
        receivedEventName = event.get("ename")
        receivedEventDate = event.get("edate")
        
        # Validate required fields
        if receivedEventID is None or receivedEventName is None or receivedEventDate is None:
            return {
                "statusCode": 400,
                "body": json.dumps({"message": "Missing required event details"})
            }
        
        # Ensure event_id is an integer
        try:
            receivedEventID = int(receivedEventID)
        except ValueError:
            return {
                "statusCode": 400,
                "body": json.dumps({"message": "event_id must be an integer"})
            }
        
        # Add the item to the DynamoDB table
        event_table.put_item(
            Item={
                "event_id": receivedEventID,
                "event_name": receivedEventName,
                "event_date": receivedEventDate
            }
        )
        
        return {
            "statusCode": 200,
            "body": json.dumps({"message": "Event added successfully"})
        }
    except Exception as e:
        return {
            "statusCode": 500,
            "body": json.dumps({"message": "Failed to add event", "error": str(e)})
        }