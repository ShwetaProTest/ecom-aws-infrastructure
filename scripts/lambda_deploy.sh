#!/bin/bash

# Define the directory containing the Lambda function and the destination for the .zip file
LAMBDA_DIR="../lambdas"
ZIP_DEST="../lambdas/preprocessing.zip"

# Navigate to the Lambda directory
cd $LAMBDA_DIR

# Zip the Lambda function code
zip -r $ZIP_DEST .

# Print a success message
echo "Lambda function packaged successfully at $ZIP_DEST"
