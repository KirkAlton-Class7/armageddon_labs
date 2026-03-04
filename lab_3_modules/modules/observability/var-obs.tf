
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





# ----------------------------------------------------------------
# INPUT — ALB ARN Suffix
# ----------------------------------------------------------------
variable "rds_app_public_alb_arn_suffix" {
  description = "ARN suffix used for CloudWatch metrics"
  type        = string
}


# ----------------------------------------------------------------
# INPUT — Target Group ARN Suffix
# ----------------------------------------------------------------
variable "rds_app_asg_tg_arn_suffix" {
  description = "ARN suffix used for CloudWatch metrics"
  type        = string
}



variable "waf_log_mode" {
  type = object({
    create_direct_resources   = bool
    create_firehose_resources = bool
    target                    = string
  })
}





# ----------------------------------------------------------------
# VARIABLE — VPC Flow Log Role ARN
# ----------------------------------------------------------------
variable "vpc_flow_log_role_arn" {
  description = "ARN of the IAM role used by VPC Flow Logs to publish logs"
  type        = string
}



# ----------------------------------------------------------------
# VARIABLE — Firehose Network Telemetry Role ARN
# ----------------------------------------------------------------
variable "firehose_network_telemetry_role_arn" {
  description = "ARN of the Firehose Network Telemetry IAM role"
  type        = string
  default     = null
}


# ----------------------------------------------------------------
# VARIABLE — RDS DB Identifier
# ----------------------------------------------------------------
variable "db_identifier" {
  description = "Identifier of the RDS database instance"
  type        = string
}

# ----------------------------------------------------------------
# INPUT — ASG Name
# ----------------------------------------------------------------
variable "rds_app_asg_name" {
  description = "Name of the RDS App Auto Scaling Group"
  type        = string
}


# ----------------------------------------------------------------
# INPUT — WAF Web ACL Name
# ----------------------------------------------------------------
variable "rds_app_waf_name" {
  description = "Name of the RDS App WAF Web ACL"
  type        = string
}


# ----------------------------------------------------------------
# INPUT — WAF Web ACL ARN
# ----------------------------------------------------------------
variable "rds_app_waf_arn" {
  description = "ARN of the RDS App WAF Web ACL"
  type        = string
}