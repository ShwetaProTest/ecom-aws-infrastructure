#!/bin/bash

# Define the directory containing the Lambda function and the destination for the .zip file
# Define paths
LAMBDA_PATH="./lambdas/preprocessing/"
S3_BUCKET="s3-bucket-name"
S3_KEY="lambdas/preprocessing/"

# Zip the Lambda code
zip -j $LAMBDA_PATH ./lambdas/*

# Upload to S3
aws s3 cp $LAMBDA_PATH s3://$S3_BUCKET/$S3_KEY