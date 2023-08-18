#!/bin/bash

# Expected argument: environment (e.g., "dev", "staging", "prod")
ENVIRONMENT=$1

if [ -z "$ENVIRONMENT" ]; then
    echo "Error: No environment specified."
    exit 1
fi

# Fetch secrets from Doppler and set as environment variables
eval $(doppler secrets download --project ecom-aws-infrastructure --config $ENVIRONMENT --format env)

# Optionally: Configure AWS CLI, if you have specific profiles or regions for each environment
# aws configure set profile.my_profile.region us-west-1

# Print a success message
echo "Environment set up successfully for $ENVIRONMENT"
