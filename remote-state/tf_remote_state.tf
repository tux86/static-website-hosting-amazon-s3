terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
  required_version = "~> 1.5"
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "remote-state" {
  bucket = "tux86-terraform"

  lifecycle {
    prevent_destroy = true
  }
}


resource "aws_s3_bucket_versioning" "remote-state" {
  bucket = aws_s3_bucket.remote-state.id

  versioning_configuration {
    status = "Enabled"
  }

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "remote-state" {
  bucket = aws_s3_bucket.remote-state.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }

  lifecycle {
    prevent_destroy = true
  }

}

resource "aws_dynamodb_table" "terraform-state-lock" {
  name         = "terraform-state-lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  lifecycle {
    prevent_destroy = true
  }
}

output "s3_backend_arn" {
  value       = aws_s3_bucket.remote-state.arn
  description = "The S3 Bucket ARN"
}

output "dynamodb_table_name" {
  value       = aws_dynamodb_table.terraform-state-lock.name
  description = "The Name of the Dynamo DB table"
}
