variable "aws_account_id" {
  type        = string
  description = "The AWS account to deploy to."
}

variable "aws_region" {
  type        = string
  description = "The AWS region this is hosted in."
}

variable "environment" {
  type        = string
  description = "The environment to deploy to."
}

variable "bucket_name" {
  type        = string
  description = "The name of the s3 bucket."
}

variable "index_html" {
  type        = string
  description = "The name of the index document to serve as a static site (e.g., 'index.html')."
}

variable "error_html" {
  type        = string
  description = "The name of the object key when a 4XX class error occurs (e.g., '404.html')."
}

variable "cloudfront_price_class" {
  type        = string
  description = "The price class for the cloudfront distribution."
}

variable "domain_name" {
  type        = string
  description = "The domain name."
}

variable "dns_record_type" {
  type = string
  description = "The type of DNS record to create."
}
