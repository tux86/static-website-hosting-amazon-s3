variable "aws_region" {
  type        = string
  description = "AWS Region"
}

variable "prefix" {
  type        = string
  description = "The prefix to be added to resource names"
}

variable "domain_name" {
  type        = string
  description = "The domain name for the website."
}

variable "bucket_name" {
  type        = string
  description = "The name of the bucket without the www. prefix. Normally domain_name."
}

variable "common_tags" {
  type        = map(string)
  description = "Common tags you want applied to all components."
}
