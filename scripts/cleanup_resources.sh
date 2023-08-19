#!/bin/bash

# Move to Terraform directory
cd ./terraform

# Destroy resources
DOPPLER_ENVIRONMENT=${1:-dev}
terraform destroy -auto-approve -var-file=environments/$DOPPLER_ENVIRONMENT.tfvars
