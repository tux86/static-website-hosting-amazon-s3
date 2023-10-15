terraform {
  backend "s3" {
    encrypt        = true
    bucket         = "my-org-tf-state"
    dynamodb_table = "my-org-tf-state-lock"
    key            = "my-static-website.tfstate"
    region         = "us-east-1"
  }
}
