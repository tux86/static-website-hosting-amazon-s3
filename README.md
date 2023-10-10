
# Terraform Project for [YourDomain.com]

Deploy a secure & highly available static website on AWS using S3, CloudFront, ACM and Route53 with Terraform.

## Architecture

![architecture-diagram-aws-static-website](https://github.com/tux86/walidkarray.com/assets/9397970/afe103cf-b83e-4146-b669-53d82a818806)

## Prerequisites

Ensure you have the following prerequisites before starting:
- An **AWS Account**
- **[AWS CLI](https://aws.amazon.com/cli/)** configured with the necessary credentials
- **[Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli)** v1.x.x installed
- **Git** (Optional)

## Infrastructure Overview

This Terraform project provisions the following AWS resources:
- **S3**: Utilized for website hosting
- **CloudFront**: CDN distribution for the S3 bucket
- **Route53**: DNS management for a custom domain
- **ACM**: SSL certificate to secure HTTPS connections

## Setup Instructions

### 1. Clone the Repository

Clone the repository and navigate to the project directory:

```sh
git clone git@github.com:tux86/static-website-hosting-amazon-s3.git
cd static-website-hosting-amazon-s3
```

### 2. Initialize Terraform

Initialize your Terraform configuration files:

```sh
terraform init
```

### 3. Plan and Apply

Review the actions to be performed by Terraform and apply them:

```sh
terraform plan
terraform apply
```

### 4. Cleanup

To destroy the provisioned infrastructure, use:

```sh
terraform destroy
```

## Variable Configuration

Update variable values in `terraform.tfvars` as per your AWS setup and domain details:

```hcl
aws_region  = "your-target-aws-region"
domain_name = "yourdomain.com"
...
```

