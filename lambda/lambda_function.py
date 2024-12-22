import boto3
import json

# Initialize DynamoDB resource outside the handler
dynamodb = boto3.resource("dynamodb")
event_table = dynamodb.Table("event_management")

def lambda_handler(event, context):
    try:
        # Print the entire event to CloudWatch logs for debugging
        print("Received event:", json.dumps(event))

        # Parse the body (which is a string) into JSON
        event_data = json.loads(event["body"])

        # Extract values from the parsed body
        receivedEventID = event_data.get("eid")
        receivedEventName = event_data.get("ename")
        receivedEventDate = event_data.get("edate")

        # Add the item to the DynamoDB table
        event_table.put_item(
            Item={
                "event_id": int(receivedEventID),  # Convert to integer
                "event_name": receivedEventName,
                "event_date": receivedEventDate
            }
        )

        # Return success response
        return {
            "statusCode": 200,
            "body": json.dumps({"message": "Event added successfully"})
        }

    except Exception as e:
        # Log the error and return error response
        print(f"Error occurred: {str(e)}")
        return {
            "statusCode": 500,
            "body": json.dumps({"message": "Failed to add event", "error": str(e)})
        }
