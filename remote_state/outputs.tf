output "s3_backend_arn" {
  value       = aws_s3_bucket.remote_state.arn
  description = "The name S3 Bucket ARN for terraform remote state"
}

output "dynamodb_table_name" {
  value       = aws_dynamodb_table.terraform_state_lock.name
  description = "The name of the DynamoDB table for terraform state lock"
}
