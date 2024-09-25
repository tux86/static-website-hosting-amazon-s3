#  Static Website Hosting on AWS with Terraform

This project sets up a static website hosting on AWS using Terraform. The architecture leverages AWS Route 53, CloudFront, S3, Certificate Manager, and a CloudFront Function to provide a highly available, scalable, and secure solution.

## Further Reading

For a deeper understanding of this project and mastering static website hosting on AWS with Terraform, I recommend reading the following article on Medium:

[Mastering Static Website Hosting on AWS with Terraform: A Step-by-Step Tutorial](https://medium.com/@walid.karray/mastering-static-website-hosting-on-aws-with-terraform-a-step-by-step-tutorial-5401ccd2f4fb)

## Architecture Diagram

![architecture-diagram-aws-static-website](https://github.com/tux86/static-website-hosting-amazon-s3/assets/9397970/5023726f-1887-49e4-b845-1cd6da959ec2)

- **Client**: End user accessing the website.
- **Route53**: AWS's Domain Name System (DNS) service that resolves DNS queries.
- **Certificate Manager (TLS Certificate)**: Manages SSL/TLS certificates for HTTPS communication.
- **CloudFront Distribution**: Content Delivery Network (CDN) service for serving cached or original content from S3.
- **CloudFront OAC + S3 Bucket Policy**: Secures S3 bucket access to authorized CloudFront distributions using Origin Access Control (OAC).
- **CloudFront Function**: Handles HTTP redirects for domain consistency.
- **Private S3 Bucket**: Stores website’s static assets with restricted direct public access.
- **Static Web Files**: HTML, CSS, and JavaScript files constituting the static website content.

## Getting Started

### Prerequisites:

- Install [Terraform](https://www.terraform.io/downloads.html)
- Configure AWS CLI with appropriate credentials.

### Configuring Variables:

Before deploying the infrastructure, it's crucial to set up the necessary variables. Terraform utilizes variables to manage settings in a flexible manner. Follow the steps below to configure your variables:

**Creating a Variables File**:
- Create a file named `terraform.tfvars` in the project root.
- This file will hold the values for the variables defined in `variables.tf`.

```plaintext
# Example terraform.tfvars content

aws_region  = "us-west-2"
prefix      = "your-org-prefix"
domain_name = "yourdomain.com"
bucket_name = "website-name-frontend"
common_tags =  {
  ManagedBy = "Terraform"
  Org       = "My Organization name"
  Project   = "Static Website"
}
```
### Deploy to AWS:

1. **Initialize Terraform**:
   ```bash
   terraform init
   ```

2. **Generate an Execution Plan**:
   ```bash
   terraform plan
   ```

3. **Apply the Configuration**:
   ```bash
   terraform apply
   ```

###  Cleanup

To destroy the provisioned infrastructure, use:

```sh
terraform destroy
```

## Thank You

I appreciate your interest in this project and thank you for taking the time to explore it. Your involvement is crucial to the success and the community around the project.

## Contribution

Contributions to this project are welcomed! Whether it's reporting bugs, suggesting enhancements, or writing and refactoring code, your help is always appreciated. Feel free to open an issue or create a pull request.

