# ----------------------------------------------------------------
# SAO PAULO VARIABLES — Application Identity
# ----------------------------------------------------------------

variable "region" {
  description = "AWS region."
  type        = string
  default     = "us-west-2"
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
# SAO PAULO VARIABLES — Edge / DNS / CDN
# ----------------------------------------------------------------

variable "manage_route53_in_terraform" {
  description = "Manage Route53 hosted zone and records in Terraform."
  type        = bool
  default     = false
}

variable "route53_private_zone" {
  description = "Whether the Route53 hosted zone is private."
  type        = bool
  default     = false
}

variable "root_domain" {
  description = "Root DNS domain."
  type        = string
  default     = "kirkdevsecops.com"
}

# ----------------------------------------------------------------
# SAO PAULO VARIABLES — Database
# ----------------------------------------------------------------

variable "db_engine" {
  description = "Database engine type."
  type        = string
  default     = "mysql"

  validation {
    condition     = contains(["mysql", "postgres", "sqlserver", "oracle"], lower(var.db_engine))
    error_message = "db_engine must be one of: mysql, postgres, sqlserver, oracle."
  }
}

variable "db_username" {
  description = "Database admin username."
  type        = string
  default     = "admin"
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
# SAO PAULO VARIABLES — Demonstration
# ----------------------------------------------------------------

variable "demo_owner" {
  description = "Demo variable for module normalization patterns."
  type        = string
  default     = "DevSecOpsTeam"
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