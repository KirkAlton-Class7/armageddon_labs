# ----------------------------------------------------------------
# SAO PAULO VARIABLES — Application Identity
# ----------------------------------------------------------------

variable "region" {
  description = "AWS region."
  type        = string
  default     = "sa-east-1"
}

variable "app" {
  description = "Application name."
  type        = string
  default     = "rds-app"
}

variable "env" {
  description = "Deployment environment (dev, test, prod)."
  type        = string
  default     = "dev"

  validation {
    condition     = contains(["dev", "test", "prod"], var.env)
    error_message = "Environment must be: dev, test, or prod."
  }
}

# ----------------------------------------------------------------
# SAO PAULO VARIABLES — Networking
# ----------------------------------------------------------------

variable "vpc_cidr" {
  description = "VPC CIDR block."
  type        = string
  default     = "10.10.0.0/16"
}

# ----------------------------------------------------------------
# SAO PAULO VARIABLES — Route53 Management
# ----------------------------------------------------------------

variable "root_domain" {
  description = "Root DNS domain."
  type        = string
  default     = "kirkdevsecops.com"
}

# ----------------------------------------------------------------
# SAO PAULO VARIABLES — Compute
# ----------------------------------------------------------------
variable "ami_id" {
  description = "Golden AMI for Sao Paulo compute instances. Ex: ami-0365298ecd8182a83"
  default     = "ami-0569b9007d23630c2"
  type        = string
}

# ----------------------------------------------------------------
# SAO PAULO VARIABLES — WAF Logging & Observability
# ----------------------------------------------------------------

variable "waf_log_destination" {
  description = "WAF log destination: cloudwatch, s3, or firehose."
  type        = string
  default     = "cloudwatch"

  validation {
    condition     = contains(["cloudwatch", "s3", "firehose"], lower(var.waf_log_destination))
    error_message = "waf_log_destination must be one of: cloudwatch, s3, firehose."
  }
}

variable "waf_log_retention_days" {
  description = "Retention period for WAF CloudWatch logs (days)."
  type        = number
  default     = 14
}

variable "enable_waf_sampled_requests_only" {
  description = "Enable sampled request visibility only."
  type        = bool
  default     = false
}

variable "enable_direct_service_log_delivery" {
  description = "Enable direct AWS service log delivery to CloudWatch Logs."
  type        = bool
  default     = false
}

# ----------------------------------------------------------------
# SAO PAULO VARIABLES — ALB Logging
# ----------------------------------------------------------------

variable "alb_access_logs_prefix" {
  description = "S3 key prefix for ALB access logs."
  type        = string
  default     = "alb-access-logs"
}

variable "alb_log_s3" {
  description = "Enable ALB access logging to S3."
  type        = bool
  default     = true
}

# ----------------------------------------------------------------
# SAO PAULO VARIABLES — Transit Gateway (Spoke)
# ----------------------------------------------------------------
variable "tgw_role" {
  description = "Transit Gateway role in topology (e.g., hub, spoke)."
  type        = string
  default     = "spoke"

  validation {
    condition     = contains(["hub", "spoke"], lower(var.tgw_role))
    error_message = "tgw_role must be either: hub or spoke."
  }
}

variable "tgw_tags" {
  description = "Tags applied to the Transit Gateway."
  type        = map(string)

  default = {
    Region       = "saopaulo"
    Role         = "spoke"
    Component    = "network"
    Connectivity = "inter-vpc"
    Scope        = "regional"
  }
}

# ----------------------------------------------------------------
# SAO PAULO VARIABLES — Demonstration
# ----------------------------------------------------------------

variable "demo_owner" {
  description = "Demo variable for module normalization patterns."
  type        = string
  default     = "DevSecOpsTeam"
}