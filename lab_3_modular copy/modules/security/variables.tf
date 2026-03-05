# ----------------------------------------------------------------
# INPUT VARIABLES — WAF Logging & Observability
# ----------------------------------------------------------------

# Account ID
variable "account_id" {
  type        = string
  description = "AWS Account ID"
}
# VPC CIDR
variable "vpc_cidr" {
  type        = string
  description = "VPC CIDR Block"
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

# # Bucket Suffix
# variable "bucket_suffix" {
#   type = string
# }









# ----------------------------------------------------------------
# INPUT VARIABLES — WAF Logging & Observability
# ----------------------------------------------------------------


# Input WAF Log Retention Period
variable "waf_log_retention_days" {
  type        = number
  description = "Retention period for WAF CloudWatch log group (days)."
}

# Toggle WAF Sampled Requests Only
variable "enable_waf_sampled_requests_only" {
  type        = bool
  description = "If true, use sampled request visibility only (lower cost). If false, allows a full WAF logging design to be introduced later."
}

# Toggle Direct Service Log Delivery
variable "enable_direct_service_log_delivery" {
  type        = bool
  description = "Whether AWS services deliver logs directly to CloudWatch Logs (requires resource policy)."
}

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