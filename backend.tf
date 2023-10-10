terraform {
  backend "s3" {
    encrypt        = true
    bucket         = "tux86-terraform"
    dynamodb_table = "terraform-state-lock"
    key            = "terraform.tfstate"
   // workspace_key_prefix = ""
    region         = "us-east-1"
  }
}
