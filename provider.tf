provider "aws" {
  shared_credentials_files = ["~/.aws/credentials"]
  region                   = var.aws_region
  #  profile                  = "default"
}

# CloudFront requires SSL certificates to be provisioned in the North Virginia (us-east-1) region.
provider "aws" {
  alias  = "acm_provider"
  region = "us-east-1"
}
