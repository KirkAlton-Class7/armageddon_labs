variable "create_waf" {
  description = "Whether to create the CloudFront WAF Web ACL."
  type        = bool
  default     = false
}


# ----------------------------------------------------------------
# SECURITY VARIABLES — Account and Networking Inputs
# ----------------------------------------------------------------

variable "account_id" {
  description = "AWS account ID."
  type        = string
}

variable "vpc_id" {
  description = "VPC ID."
  type        = string
}

variable "vpc_cidr" {
  description = "VPC CIDR block."
  type        = string
}

# ----------------------------------------------------------------
# SECURITY VARIABLES — Deployment Context
# ----------------------------------------------------------------

variable "context" {
  description = "Deployment context containing region, application name, environment, and common tags."
  type = object({
    region = string
    app    = string
    env    = string
    tags   = map(string)
  })
}

# ----------------------------------------------------------------
# SECURITY VARIABLES — Naming Configuration
# ----------------------------------------------------------------

variable "name_prefix" {
  description = "Prefix for resource names."
  type        = string
}

variable "name_suffix" {
  description = "Suffix for resource names."
  type        = string
}

# ----------------------------------------------------------------
# SECURITY VARIABLES — WAF Logging Configuration
# ----------------------------------------------------------------

variable "waf_log_retention_days" {
  description = "Retention period for WAF CloudWatch logs (days)."
  type        = number
}

variable "enable_waf_sampled_requests_only" {
  description = "Enable sampled request visibility only."
  type        = bool
}

variable "enable_direct_service_log_delivery" {
  description = "Enable direct AWS service log delivery to CloudWatch Logs."
  type        = bool
}

# ----------------------------------------------------------------
# SECURITY VARIABLES — WAF Logging Mode Configuration
# ----------------------------------------------------------------

variable "waf_log_mode" {
  description = "WAF logging configuration."
  type = object({
    create_direct_resources   = bool
    create_firehose_resources = bool
    target                    = string
  })
}

variable "waf_log_destination_arn" {
  description = "WAF log destination ARN."
  type        = string
}


# ----------------------------------------------------------------
# SECURITY VARIABLES — Observability Integration (WAF Log Bucket)
# ----------------------------------------------------------------
variable "waf_logs_bucket_arn" {
  description = "ARN of the S3 bucket for WAF logs"
  type        = string
}

variable "waf_logs_bucket_id" {
  description = "ID of the S3 bucket for WAF logs"
  type        = string
}