# ----------------------------------------------------------------
# OBSERVABILITY — VARIABLES
# ----------------------------------------------------------------

# ----------------------------------------------------------------
# GLOBAL — Identity & Networking
# ----------------------------------------------------------------

variable "account_id" {
  description = "AWS account ID."
  type        = string
}

variable "vpc_id" {
  description = "VPC ID."
  type        = string
}

variable "context" {
  description = "Deployment context (region, app, env, tags)."
  type = object({
    region = string
    app    = string
    env    = string
    tags   = map(string)
  })
}

# ----------------------------------------------------------------
# NAMING — Resource Naming
# ----------------------------------------------------------------

variable "name_prefix" {
  description = "Resource name prefix."
  type        = string
}

variable "name_suffix" {
  description = "Resource name suffix."
  type        = string
}

variable "bucket_suffix" {
  description = "S3 bucket name suffix."
  type        = string
}

# ----------------------------------------------------------------
# FEATURE FLAGS — Observability Scope
# ----------------------------------------------------------------

variable "enable_db_observability" {
  description = "Enable DB-specific observability resources."
  type        = bool
  default     = false
}

# ----------------------------------------------------------------
# LOGGING — ALB Access Logs
# ----------------------------------------------------------------

variable "alb_log_s3" {
  description = "Enable ALB access logs to S3."
  type        = bool
}

variable "alb_access_logs_prefix" {
  description = "S3 prefix for ALB logs."
  type        = string
}

# ----------------------------------------------------------------
# METRICS — CloudWatch Inputs
# ----------------------------------------------------------------

variable "rds_app_public_alb_arn_suffix" {
  description = "ALB ARN suffix for metrics."
  type        = string
}

variable "rds_app_asg_tg_arn_suffix" {
  description = "Target group ARN suffix for metrics."
  type        = string
}

# ----------------------------------------------------------------
# LOGGING — WAF Mode
# ----------------------------------------------------------------

variable "waf_log_mode" {
  description = "WAF logging configuration."
  type = object({
    create_direct_resources   = bool
    create_firehose_resources = bool
    target                    = string
  })
}

# ----------------------------------------------------------------
# IAM — Logging Roles
# ----------------------------------------------------------------

variable "vpc_flow_log_role_arn" {
  description = "IAM role ARN for VPC flow logs."
  type        = string
}

variable "firehose_network_telemetry_role_arn" {
  description = "IAM role ARN for Firehose telemetry."
  type        = string
  default     = null
}

# ----------------------------------------------------------------
# DATABASE — Monitoring Inputs
# ----------------------------------------------------------------

variable "db_identifier" {
  description = "RDS instance identifier."
  type        = string
}

# ----------------------------------------------------------------
# COMPUTE — Monitoring Inputs
# ----------------------------------------------------------------

variable "rds_app_asg_name" {
  description = "Auto Scaling Group name."
  type        = string
}

# ----------------------------------------------------------------
# WAF — Monitoring Inputs
# ----------------------------------------------------------------

variable "rds_app_waf_name" {
  description = "WAF Web ACL name."
  type        = string
  default     = null
}

variable "rds_app_waf_arn" {
  description = "WAF Web ACL ARN."
  type        = string
}