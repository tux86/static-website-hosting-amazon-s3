provider "aws" {
  shared_credentials_files = ["~/.aws/credentials"]
  region                   = var.aws_region
  #  profile                  = "default"
}

# certificate has to be created in us-east-1 due to cloudfront pre-requisite
provider "aws" {
  alias  = "acm_provider"
  region = "us-east-1"
}
