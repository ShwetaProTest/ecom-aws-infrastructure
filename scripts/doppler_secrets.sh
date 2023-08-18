#!/bin/bash

# Ensure Doppler CLI is installed
if ! command -v doppler &> /dev/null
then
    echo "Doppler CLI could not be found. Installing..."
    curl -Ls https://cli.doppler.com/install.sh | sh
fi

# Fetch secrets from Doppler
eval $(doppler secrets download --project ecom-aws-infrastructure --config $1 --format env) # $1 is the environment like 'dev' or 'prod'

export AWS_ACCESS_KEY=$DOPPLER_AWS_ACCESS_KEY
export AWS_SECRET_KEY=$DOPPLER_AWS_SECRET_KEY
#...