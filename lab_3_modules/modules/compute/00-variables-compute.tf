# ----------------------------------------------------------------
# INPUT VARIABLES — ALB Logging
# ----------------------------------------------------------------

# Toggle ALB Access Logs
variable "enable_alb_access_logs" {
  type        = bool
  default     = true
  description = "If true, enable ALB access logging to S3."
}

# Input ALB Access Logs Prefix
variable "alb_access_logs_prefix" {
  type        = string
  description = "S3 prefix for ALB access logs (NO leading or trailing slash)"
  default     = "alb-access-logs"
}