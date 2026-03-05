# ----------------------------------------------------------------
# INPUT VARIABLES — Application Identity
# ----------------------------------------------------------------

# Region Variable (set in .tfvars)
variable "region" {
  type        = string
  description = "AWS region"
  default = "us-west-2"
}

# Input Application Name
variable "app" {
  type        = string
  description = "Application name (short)"
  default     = "rds-app"
}

# Input Environment 
variable "env" {
  type        = string
  default     = "dev"
  description = "Input environment name (dev, test, prod)."

  validation {
    condition     = contains(["dev", "test", "prod"], var.env)
    error_message = "Environment must be: dev, test, or prod."
  }
}

# ----------------------------------------------------------------
# INPUT VARIABLES — Networking
# ------------------------------------------------------

# Input VPC CIDR Block
variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC"
  default     = "10.10.0.0/16"
}

# ----------------------------------------------------------------
# INPUT VARIABLES — EDGE / DNS / Route 53
# ----------------------------------------------------------------

# Toggle Route 53 in Terraform
variable "manage_route53_in_terraform" {
  description = "If true, create/manage Route53 hosted zone and records in Terraform."
  type        = bool
  default     = false
}

# Toggle Private Route 53 Zone
variable "route53_private_zone" {
  type        = bool
  description = "If true, the Route53 hosted zone is private."
  default     = false
}

# Input Root Domain (Apex)
variable "root_domain" {
  type        = string
  description = "Root DNS name (no subdomain)"
  default     = "kirkdevsecops.com"
}

# # ----------------------------------------------------------------
# # INPUT VARIABLES — Database
# # ----------------------------------------------------------------
# variable "db_secret_arn" {
#   type        = string
#   description = "ARN of database credentials secret"
# }


# DB Engine
variable "db_engine" {
  description = "Database engine."
  type        = string
  default     = "mysql"

  validation {
    condition     = contains(["mysql", "postgres", "sqlserver", "oracle"], lower(var.db_engine))
    error_message = "db_engine must be one of: mysql, postgres, sqlserver, oracle."
  }
}


# DB Username
variable "db_username" {
  type        = string
  description = "Database admin username"
  default     = "admin"
}


# ----------------------------------------------------------------
# INPUT VARIABLES — WAF Logging & Observability
# ----------------------------------------------------------------

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


# ----------------------------------------------------------------
# INPUT VARIABLES — Demonstration (not used in deployment)
# ----------------------------------------------------------------

# Demo Owner
variable "demo_owner" { # Root Variable
  type        = string
  description = "Demonstration variable for module-level normalization patterns."
  default     = "DevSecOpsTeam"
}




# Input ALB Access Logs Prefix
variable "alb_access_logs_prefix" {
  type        = string
  description = "S3 prefix for ALB access logs (NO leading or trailing slash)"
  default     = "alb-access-logs"
}



# Toggle ALB Access Logs (S3)
variable "alb_log_s3" {
  type        = bool
  default     = true
  description = "If true, enable ALB access logging to S3."
}