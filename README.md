# ecom-aws-infrastructure
This repository contains Terraform scripts and associated utilities to deploy an e-commerce AWS infrastructure that tracks user behavior across multiple online shops and processes this data for further machine learning applications.

## Structure

<pre>
ecom-aws-infrastructure/
│
├───.github/workflows/
│   └───terraform_ci.yml
│
├───js/
│   └───track_user_behavior.js
│
├───lambdas/
│   └───preprocessing.zip
│
├───scripts/
│   ├───doppler_secrets.sh
│   ├───lambda_deploy.sh
│   └───setup_env.sh
│
├───terraform/
│   ├───main.tf
│   ├───variables.tf
│   ├───provider.tf
│   │
│   ├───environments/
│   │   ├───dev.tfvars
│   │   ├───staging.tfvars
│   │   └───prod.tfvars
│   │
│   └───modules/
│       ├───api-gateway/
│       ├───lambda/
│       ├───iam/
│       ├───kinesis/
│       ├───s3/
│       ├───athena/
│       ├───redshift/
│       └───glue/
</pre>
        

## Features

1. **User Behavior Tracking**: JavaScript integration in online shops captures user behavior events.
2. **Lambda Integration**: Events from shops are sent to a preprocessing Lambda function.
3. **Data Streaming**: Post preprocessing, events are sent to Kinesis Data Streams and then to an S3 raw bucket.
4. **Batch Processing**: Raw data in S3 is processed using AWS Glue and the transformed data is stored back in a separate S3 bucket.
5. **Data Analysis & Reporting**: Processed data is used in AWS services like Redshift, SageMaker, Athena, and QuickSight for analytics and machine learning purposes.

## Setup & Deployment

### Prerequisites

1. **Doppler**: This project uses Doppler for secret management. Ensure you have access to the required secrets in Doppler.
2. **AWS Account**: Ensure you have the necessary permissions on AWS to create and manage resources.
3. **GitHub**: Actions are set up for CI/CD. Ensure you have the `DOPPLER_CI_TOKEN` secret set up in your repository's secrets.

### Deployment

1. **Fetch Secrets**: Before running Terraform, fetch the required secrets:
    ```bash
    ./scripts/doppler_secrets.sh [environment]
    ```

2. **Terraform**:
    ```bash
    cd terraform
    terraform init
    terraform plan -var-file=environments/[environment].tfvars
    terraform apply -var-file=environments/[environment].tfvars
    ```

## Contributing

1. **Branching**: Use feature branches. Do not commit directly to `main`.
2. **Commit Messages**: Write meaningful commit messages.
3. **Testing**: Ensure to test your changes before pushing.

## Security

Always handle AWS and other secrets securely. They should never be hardcoded in scripts, exposed in logs, or stored in persistent storage without encryption.
