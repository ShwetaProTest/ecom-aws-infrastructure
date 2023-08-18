import os
import boto3

# AWS clients
s3_client = boto3.client('s3')
kinesis_client = boto3.client('kinesis')

# Environment variables
S3_BUCKET = os.environ.get('S3_RAW_BUCKET')
KINESIS_STREAM_NAME = os.environ.get('KINESIS_STREAM_NAME')

def handler(event, context):
    # preprocess event data
    # ...

    # For batch processing
    save_to_s3(event)

    # For real-time processing
    send_to_kinesis(event)

    return {
        'statusCode': 200,
        'body': "Event processed successfully."
    }

def save_to_s3(event):
    # Logic to save data to S3
    s3_key = "raw_data/data.json"
    s3_client.put_object(Bucket=S3_BUCKET, Key=s3_key, Body=str(event))

def send_to_kinesis(event):
    kinesis_client.put_record(
        StreamName=KINESIS_STREAM_NAME,
        Data=str(event),
        PartitionKey="PartitionKey" 
    )
