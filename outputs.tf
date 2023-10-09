output "s3_url" {
  description = "S3 hosting URL (HTTP)"
  value       = "http://${aws_s3_bucket_website_configuration.website_bucket.website_endpoint}"
}

output "cdn_url" {
  description = "Cloudfront distribution URL (HTTPS)"
  value       = "https://${aws_cloudfront_distribution.root_s3_distribution.domain_name}"
}

output "website_url" {
  description = "Website URL (HTTPS)"
  value       = "https://${var.domain_name}"
}
