# ----------------------------------------------------------------
# INPUT VARIABLES — WAF Logging & Observability
# ----------------------------------------------------------------

variable "account_id" {
    type = string
    description = "AWS Account ID"
}

variable "context" {
  type = object({
    region = string
    app  = string
    env  = string
    tags = map(string)
  })
}

# Toggle Direct Service Log Delivery
variable "enable_direct_service_log_delivery" {
  type        = bool
  description = "Whether AWS services deliver logs directly to CloudWatch Logs (requires resource policy)."
}

# Name Suffix
variable "name_suffix" {
  type = string
}

# # Bucket Suffix
# variable "bucket_suffix" {
#   type = string
# }