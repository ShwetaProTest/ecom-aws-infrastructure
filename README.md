# E-Commerce Behavioral AWS Infrastructure
Welcome to the ecom-behavioral-aws-infrastructure repository! This project is more than just tracking: it is a comprehensive AWS infrastructure setup using Terraform that captures, processes, and propels e-commerce user behaviors into the realms of advanced analytics, machine learning, visualization, and database loading.

## Introduction
Modern e-commerce isn't just about online transactions; it's about understanding every nuance of the user journey. With every click, every product interaction, and every purchase decision, customers paint a rich tapestry of behavior, preferences, and intent. This infrastructure not only captures this tapestry in real-time but also processes, analyzes, and visualizes it, unlocking actionable insights.

## Directory Structure

<pre>
ecom-aws-infrastructure
- **.github/workflows/**
  - `terraform_workflow.yml`
  
- **js/**
  - `track_user_behavior.js`
  
- **lambdas/**
  - **preprocessing/**
  | - `main.py`
  | - `requirements.txt`

- **scripts/**
  - `doppler_secrets.sh`
  - `lambda_deploy.sh`
  - `setup_env.sh`
  
- **terraform/**
  - `main.tf`
  - `variables.tf`
  - `provider.tf`
  - `outputs.tf`
  - `.gitignore`
  - `README.md`
  
  - **environments/**
    - `dev.tfvars`
    - `staging.tfvars`
    - `prod.tfvars`
    
  - **modules/**
    - **codebuild/**
    - **codecommit/**
    - **codepipeline/**
    - **networking/**
    - **api-gateway/**
    - **lambda/**
    - **iam/**
    - **kinesis/**
    - **s3/**
    - **athena/**
    - **redshift/**
    - **glue/**
<pre>    
        

## Key Features:

1. **Real-Time Data Streaming**: Seamlessly capture user interactions across e-commerce platforms and stream the data in real time.
2. **Scalable & Modular Infrastructure**: Built with Terraform, the architecture ensures modularity, repeatability, and scalability across diverse AWS environments (dev, staging, prod).
3. **Data Preprocessing & Validation**: AWS Lambda preprocesses, validates, and formats raw behavioral data before streaming, ensuring quality and consistency.
4. **Robust Data Storage & ETL**: Raw and processed data are stored securely in AWS S3. Using AWS Glue, the data undergoes ETL processes to become structured and ready for advanced analytics.
5. **Advanced Analytics & Machine Learning**: Dive into data-driven insights with tools like AWS Redshift and SageMaker. Apply machine learning models to predict user behaviors, preferences, and potential churn.
6. **Visualization & Reporting**: Leverage AWS Quicksight for intuitive data visualizations, dashboards, and reports, making data interpretation easy and actionable.
7. **Database Loading**: Structured and processed data can be seamlessly loaded into databases, ensuring the data is ready for any further applications or analysis.

## Setup & Deployment

### Prerequisites

1. **Doppler**: This project uses Doppler for secret management. Ensure to have access to the required secrets in Doppler and Configure secrets in Doppler for dev, staging, and prod environments.
2. **AWS Account**: Ensure to have the necessary permissions on AWS to create and manage resources.
3. **GitHub**: Actions are set up for CI/CD. Ensure to have the `DOPPLER_CI_TOKEN` secret set up in your repository's secrets.
4. **Terraform**: Ensure Terraform is installed and configured remote state storage(AWS s3)
5. **Development Environment**:Depending on the language for Lambda functions, ensure SDKs/runtimes are set up(Python)

### Installation 

1. **Step1**: Clone the Repository
    ```bash
    git clone https://github.com/[YOUR_USERNAME]/ecom-behavioral-aws-infrastructure.git
    cd ecom-behavioral-aws-infrastructure
    ```

2. **Step2**: Fetch Secrets from Doppler
    ```bash
    doppler secrets download --project ecom-aws-infrastructure --config [ENVIRONMENT] --format env
    ```

3. **Step3**: Initialize Terraform
    ```bash
    cd terraform
    terraform init
    ```

4. **Step4**: Plan & Apply Terraform Changes
    ```bash
    terraform plan -var-file=environments/[ENVIRONMENT].tfvars
    terraform apply -auto-approve -var-file=environments/[ENVIRONMENT].tfvars
    ```
## Architecture Overview


## Contributing

1. **Branching**: Use feature branches. Do not commit directly to `main`.
2. **Commit Messages**: Write meaningful commit messages.
3. **Testing**: Ensure to test the changes before pushing.

## Security

Always handle AWS and other secrets securely. They should never be hardcoded in scripts, exposed in logs, or stored in persistent storage without encryption.
