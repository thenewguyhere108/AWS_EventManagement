# AWS Event Management Application

![Screenshot 2024-12-23 234830](https://github.com/user-attachments/assets/16e7b6d5-117b-481d-a1ff-961b38ee591e)


## Overview
This web-based event management application is deployed on AWS, offering an efficient platform to handle event registrations. The frontend is built with HTML, CSS, and JavaScript, and is hosted on an EC2 instance. The backend is powered by AWS Lambda functions, triggered via an HTTP API Gateway. Event data is stored in Amazon DynamoDB, ensuring scalable and fast storage. The infrastructure is provisioned using Terraform, enabling easy deployment and teardown.

## Screenshot
![Screenshot 2024-12-24 002730](https://github.com/user-attachments/assets/ac2b46c4-83a9-42c2-ac40-aaca0e243fdc)

## Tech Stack
- **Frontend**: HTML, CSS, JavaScript
- **Backend**: AWS Lambda, AWS API Gateway
- **Database**: Amazon DynamoDB
- **Hosting**: Amazon EC2
- **Infrastructure as Code**: Terraform

## Requirements
- **AWS CLI** (configured with appropriate permissions)
- **Terraform** (for infrastructure setup)
- **AWS Default VPC** (Modify the code accordingly if you're using a different VPC)

## Setup Instructions

### 1. Clone the Repository
```bash
git clone https://github.com/thenewguyhere/AWS_EventManagement.git
cd AWS_EventManagement
```

### 2. Run Terraform
To set up the infrastructure, first initialize Terraform:
``` bash
terraform init
```
### 3. Apply Terraform Configuration
Run the Terraform apply command to create the AWS resources (API Gateway, Lambda functions, DynamoDB, EC2 instance):
```bash
terraform apply
```
Terraform will show a plan of the resources to be created. Review the changes, type yes to proceed.  

### 4. Wait for Deployment
Once the Terraform plan is applied, the resources will be provisioned. It may take a few minutes for the EC2 instance to install Apache2 and become accessible. After a few minutes, Terraform will provide a public URL for accessing the event registration form. Test the URL after approximately 5 minutes.

### 5. Access the Application
Once the infrastructure is deployed, navigate to the public URL provided by Terraform to access the event registration form hosted on the EC2 instance.

### Teardown Instructions
After testing the application, it is important to tear down the infrastructure to avoid unnecessary costs. Run the following command to destroy the provisioned resources:
``` bash
terraform destroy
```
This will delete the EC2 instance, API Gateway, Lambda functions, and DynamoDB table.
