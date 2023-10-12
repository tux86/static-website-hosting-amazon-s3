terraform {
  backend "s3" {
    encrypt        = true
    bucket         = "tux86-terraform"
    dynamodb_table = "terraform-state-lock"
    key            = "static_website/terraform.tfstate"
    region         = "us-east-1"
  }
}
