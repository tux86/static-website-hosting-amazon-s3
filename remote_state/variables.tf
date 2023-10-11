variable "remote_state_s3_bucket_region" {
  description = "AWS region for state file, e.g. us-east-1"
}

variable "remote_state_s3_bucket_name" {
  description = "Bucket name for remote state, e.g. org-project-tfstate"
}

variable "state_lock_dynamodb_table_name" {
  description = "Dynamodb table name for remote state lock, e.g. org-project-state-lock"
}
