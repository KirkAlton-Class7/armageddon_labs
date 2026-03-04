# ----------------------------------------------------------------
# INPUT VARIABLES — WAF Logging & Observability
# ----------------------------------------------------------------

variable "account_id" {
  type        = string
  description = "AWS Account ID"
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

# Toggle Direct Service Log Delivery
variable "enable_direct_service_log_delivery" {
  type        = bool
  description = "Whether AWS services deliver logs directly to CloudWatch Logs (requires resource policy)."
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












variable "db_secret_arn" {
  type = string
}

variable "vpc_flow_log_group_arn" {
  type = string
}



variable "waf_firehose_log_group_arn" {
  type = string
}


variable "waf_firehose_log_bucket_arn" {
  type = string
}


variable "waf_direct_log_group_arn" {
  type = string
}

variable "waf_log_mode" {
  type = object({
    create_direct_resources   = bool
    create_firehose_resources = bool
    target                    = string
  })
}