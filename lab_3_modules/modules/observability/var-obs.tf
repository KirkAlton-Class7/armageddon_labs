
# Account ID
variable "account_id" {
  type        = string
  description = "AWS Account ID"
}

# VPC ID
variable "vpc_id" {
  type        = string
  description = "VPC ID"
}

variable "context" {
  type = object(
    {
      region = string
      app    = string
      env    = string
      tags   = map(string)
    }
  )
}



# Name Prefix
variable "name_prefix" {
  type = string
}

# Name Suffix
variable "name_suffix" {
  type = string
}

# Bucket Suffix
variable "bucket_suffix" {
  type = string
}

# Toggle ALB Access Logs (S3)
variable "alb_log_s3" {
  type        = bool
  description = "If true, enable ALB access logging to S3."
}

# Input ALB Access Logs Prefix
variable "alb_access_logs_prefix" {
  type        = string
  description = "S3 prefix for ALB access logs (NO leading or trailing slash)"
}



variable "vpc_id" {
  type = string
}

variable "alb_arn_suffix" {
  type = string
}

variable "tg_arn_suffix" {
  type = string
}

variable "db_identifier" {
  type = string
}