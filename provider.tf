provider "aws" {
  shared_credentials_files = ["~/.aws/credentials"]
  region                   = var.aws_region
  #  profile                  = "default"
}

provider "aws" {
  alias  = "acm_provider"
  region = "us-east-1"
}