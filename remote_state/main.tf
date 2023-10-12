# Define an AWS S3 bucket to store Terraform state files
resource "aws_s3_bucket" "remote_state" {
  bucket = var.remote_state_s3_bucket_name

  # Prevent the bucket from being accidentally destroyed
  lifecycle {
    prevent_destroy = true
  }
}

# Enable versioning on the S3 bucket
resource "aws_s3_bucket_versioning" "remote_state" {
  bucket = aws_s3_bucket.remote_state.id

  versioning_configuration {
    status = "Enabled"
  }

  # Prevent the versioning configuration from being accidentally destroyed
  lifecycle {
    prevent_destroy = true
  }
}

# Enable server-side encryption for the S3 bucket
resource "aws_s3_bucket_server_side_encryption_configuration" "remote_state" {
  bucket = aws_s3_bucket.remote_state.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256" # Use AES256 encryption algorithm
    }
  }

  # Prevent the encryption configuration from being accidentally destroyed
  lifecycle {
    prevent_destroy = true
  }
}

# Define a DynamoDB table to manage state locking and consistency
resource "aws_dynamodb_table" "terraform_state_lock" {
  name         = var.state_lock_dynamodb_table_name
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  # Define the attributes of the primary key
  attribute {
    name = "LockID"
    type = "S"
  }

  # Prevent the DynamoDB table from being accidentally destroyed
  lifecycle {
    prevent_destroy = true
  }
}
