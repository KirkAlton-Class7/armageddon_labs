# ----------------------------------------------------------------
# SECURITY — Account and Networking Inputs
# ----------------------------------------------------------------

variable "account_id" {
  type        = string
  description = "AWS Account ID"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID"
}

variable "vpc_cidr" {
  type        = string
  description = "VPC CIDR Block"
}

# ----------------------------------------------------------------
# SECURITY — Deployment Context
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
# SECURITY — Naming Configuration
# ----------------------------------------------------------------

variable "name_prefix" {
  type = string
}

variable "name_suffix" {
  type = string
}

# ----------------------------------------------------------------
# SECURITY — WAF Logging Configuration
# ----------------------------------------------------------------

variable "waf_log_retention_days" {
  type        = number
  description = "Retention period for WAF CloudWatch log group (days)."
}

variable "enable_waf_sampled_requests_only" {
  type        = bool
  description = "If true, use sampled request visibility only (lower cost). If false, allows a full WAF logging design to be introduced later."
}

variable "enable_direct_service_log_delivery" {
  type        = bool
  description = "Whether AWS services deliver logs directly to CloudWatch Logs (requires resource policy)."
}

# ----------------------------------------------------------------
# SECURITY — WAF Logging Mode Configuration
# ----------------------------------------------------------------

variable "waf_log_mode" {
  type = object({
    create_direct_resources   = bool
    create_firehose_resources = bool
    target                    = string
  })
}

variable "waf_log_destination_arn" {
  type        = string
  description = "Where AWS WAF delivers logs: cloudwatch | s3 | firehose"
}