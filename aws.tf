provider "aws" {
  region = var.aws_region
  #  shared_credentials_files = ["~/.aws/credentials"]
  #  profile                  = "default"
}

provider "aws" {
  alias  = "acm_provider"
  region = "us-east-1"
}
