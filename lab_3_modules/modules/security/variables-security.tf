# ----------------------------------------------------------------
# INPUT VARIABLES — WAF Logging & Observability
# ----------------------------------------------------------------

# VPC CIDR
variable "vpc_cidr" {
  type        = string
  description = "VPC CIDR Block"
}


variable "vpc_id" {
  type        = string
  description = "VPC ID"
}

variable "context" {
  type = object({
    region = string
    app  = string
    env  = string
    tags = map(string)
  })
}

# Input WAF Log Destination
variable "waf_log_destination" {
  type        = string
  description = "Where AWS WAF delivers logs: cloudwatch | s3 | firehose"
  default     = "cloudwatch"

  validation {
    condition     = contains(["cloudwatch", "s3", "firehose"], lower(var.waf_log_destination))
    error_message = "waf_log_destination must be one of: cloudwatch, s3, firehose"
  }
}

# Input WAF Log Retention Period
variable "waf_log_retention_days" {
  type        = number
  description = "Retention period for WAF CloudWatch log group (days)."
  default     = 14
}

# Toggle WAF Sampled Requests Only
variable "enable_waf_sampled_requests_only" {
  type        = bool
  default     = false
  description = "If true, use sampled request visibility only (lower cost). If false, allows a full WAF logging design to be introduced later."
}

# Toggle Direct Service Log Delivery
variable "enable_direct_service_log_delivery" {
  type        = bool
  description = "Whether AWS services deliver logs directly to CloudWatch Logs (requires resource policy)."
  default     = false
}