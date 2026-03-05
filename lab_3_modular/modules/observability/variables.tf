# ----------------------------------------------------------------
# OBSERVABILITY — Account and Networking Inputs
# ----------------------------------------------------------------

variable "account_id" {
  type        = string
  description = "AWS Account ID"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID"
}

# ----------------------------------------------------------------
# OBSERVABILITY — Deployment Context
# ----------------------------------------------------------------

variable "context" {
  type = object({
    region = string
    app    = string
    env    = string
    tags   = map(string)
  })
}

# ----------------------------------------------------------------
# OBSERVABILITY — Naming Configuration
# ----------------------------------------------------------------

variable "name_prefix" {
  type = string
}

variable "name_suffix" {
  type = string
}

variable "bucket_suffix" {
  type = string
}

# ----------------------------------------------------------------
# OBSERVABILITY — ALB Logging Configuration
# ----------------------------------------------------------------

variable "alb_log_s3" {
  type        = bool
  description = "If true, enable ALB access logging to S3."
}

variable "alb_access_logs_prefix" {
  type        = string
  description = "S3 prefix for ALB access logs (NO leading or trailing slash)"
}

# ----------------------------------------------------------------
# OBSERVABILITY — CloudWatch Metric Inputs (ALB / Target Group)
# ----------------------------------------------------------------

variable "rds_app_public_alb_arn_suffix" {
  description = "ARN suffix used for CloudWatch metrics"
  type        = string
}

variable "rds_app_asg_tg_arn_suffix" {
  description = "ARN suffix used for CloudWatch metrics"
  type        = string
}

# ----------------------------------------------------------------
# OBSERVABILITY — WAF Logging Mode Configuration
# ----------------------------------------------------------------

variable "waf_log_mode" {
  type = object({
    create_direct_resources   = bool
    create_firehose_resources = bool
    target                    = string
  })
}

# ----------------------------------------------------------------
# OBSERVABILITY — Logging IAM Roles
# ----------------------------------------------------------------

variable "vpc_flow_log_role_arn" {
  description = "ARN of the IAM role used by VPC Flow Logs to publish logs"
  type        = string
}

variable "firehose_network_telemetry_role_arn" {
  description = "ARN of the Firehose Network Telemetry IAM role"
  type        = string
  default     = null
}

# ----------------------------------------------------------------
# OBSERVABILITY — Database Monitoring Inputs
# ----------------------------------------------------------------

variable "db_identifier" {
  description = "Identifier of the RDS database instance"
  type        = string
}

# ----------------------------------------------------------------
# OBSERVABILITY — Compute Monitoring Inputs
# ----------------------------------------------------------------

variable "rds_app_asg_name" {
  description = "Name of the RDS App Auto Scaling Group"
  type        = string
}

# ----------------------------------------------------------------
# OBSERVABILITY — WAF Monitoring Inputs
# ----------------------------------------------------------------

variable "rds_app_waf_name" {
  description = "Name of the RDS App WAF Web ACL"
  type        = string
}

variable "rds_app_waf_arn" {
  description = "ARN of the RDS App WAF Web ACL"
  type        = string
}