# ----------------------------------------------------------------
# IAM VARIABLES — Logging & Observability
# ----------------------------------------------------------------

variable "account_id" {
  description = "AWS account ID."
  type        = string
}

variable "context" {
  description = "Deployment context containing region, application name, environment, and common tags."
  type = object({
    region = string
    app    = string
    env    = string
    tags   = map(string)
  })
}

variable "enable_direct_service_log_delivery" {
  description = "Enable direct AWS service log delivery to CloudWatch Logs."
  type        = bool
}

# ----------------------------------------------------------------
# IAM VARIABLES — Naming
# ----------------------------------------------------------------

variable "name_prefix" {
  description = "Prefix for resource names."
  type        = string
}

variable "name_suffix" {
  description = "Suffix for resource names."
  type        = string
}

# # Bucket Suffix
# variable "bucket_suffix" {
#   type = string
# }

# ----------------------------------------------------------------
# IAM VARIABLES — Secrets & Database
# ----------------------------------------------------------------

variable "db_secret_arn" {
  description = "Secrets Manager ARN containing database credentials."
  type        = string
}

# ----------------------------------------------------------------
# IAM VARIABLES — Log Destinations
# ----------------------------------------------------------------

variable "vpc_flow_log_group_arn" {
  description = "CloudWatch log group ARN for VPC flow logs."
  type        = string
}

variable "waf_firehose_log_group_arn" {
  description = "CloudWatch log group ARN for WAF Firehose delivery."
  type        = string
}

variable "waf_firehose_log_bucket_arn" {
  description = "S3 bucket ARN for WAF Firehose log delivery."
  type        = string
}

variable "waf_direct_log_group_arn" {
  description = "CloudWatch log group ARN for direct WAF logging."
  type        = string
}

# ----------------------------------------------------------------
# IAM VARIABLES — WAF Logging Mode
# ----------------------------------------------------------------

variable "waf_log_mode" {
  description = "WAF logging configuration."
  type = object({
    create_direct_resources   = bool
    create_firehose_resources = bool
    target                    = string
  })
}