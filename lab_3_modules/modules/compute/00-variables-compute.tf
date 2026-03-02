# ----------------------------------------------------------------
# INPUT VARIABLES — ALB Logging
# ----------------------------------------------------------------

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


variable "name_prefix" {
  type = string
}

# Name Suffix
variable "name_suffix" {
  type = string
}



variable "secret_arn" {
  type        = string
  description = "ARN of database credentials secret"
}

variable "rds_app_iam_role" {
  type        = string
  description = "ARN of RDS App IAM role"
}


variable "rds_app_asg_security_group_id" {
  type        = string
  description = "Security group ID for application ASG (RDS access)"
}



# VPC ID
variable "vpc_id" {
  type        = string
  description = "VPC ID"
}

variable "public_subnet_ids" {
  description = "Public subnet IDs"
  type = list(string)
}

variable "private_app_subnet_ids" {
  description = "Private app subnet IDs"
  type = list(string)
}


variable "public_subnet_tags" {
  type = map(string)
  description = "Tags for public subnets and resources"
}

variable "private_app_subnet_tags" {
  type = map(string)
  description = "Tags for private app subnets and resources"
}


# Edge Authentication Header
variable "edge_auth_header_name" {
  type        = string
  description = "Edge authentication header name."
}


# RDS App IAM Role Name
variable "aws_iam_role_rds_app_name" {
  type        = string
  description = "RDS App IAM Role Name"
}