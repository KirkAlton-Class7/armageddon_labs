# ----------------------------------------------------------------
# DATABASE — Input Variables (Application Context)
# ----------------------------------------------------------------

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

variable "name_prefix" {
  type = string
}

variable "name_suffix" {
  type = string
}

# ----------------------------------------------------------------
# DATABASE — Input Variables (Networking)
# ----------------------------------------------------------------

variable "public_subnets" {
  description = "Public subnet IDs"
  type        = list(string)
}

variable "private_app_subnets" {
  description = "Private app subnet IDs"
  type        = list(string)
}

variable "private_data_subnets" {
  description = "Private data subnet IDs"
  type        = list(string)
}

variable "public_subnet_tags" {
  type        = map(string)
  description = "Tags for public subnets and resources"
}

variable "private_app_subnet_tags" {
  type        = map(string)
  description = "Tags for private app subnets and resources"
}

variable "private_data_subnet_tags" {
  type        = map(string)
  description = "Tags for private subnets and resources"
}

# ----------------------------------------------------------------
# DATABASE — Input Variables (Security Groups)
# ----------------------------------------------------------------

variable "private_db_sg_id" {
  type        = string
  description = "Security Group ID for Private DB"
}

# ----------------------------------------------------------------
# DATABASE — Input Variables (Database Configuration)
# ----------------------------------------------------------------

variable "db_engine" {
  description = "Database engine."
  type        = string
}

variable "db_username" {
  type        = string
  description = "Database admin username"
}

variable "db_secret_arn" {
  type = string
}

# ----------------------------------------------------------------
# DATABASE — Input Variables (Monitoring & Alerting)
# ----------------------------------------------------------------

variable "rds_enhanced_monitoring_role_arn" {
  description = "ARN of the IAM role used for RDS Enhanced Monitoring"
  type        = string
}

variable "rds_failure_alert_topic_arn" {
  description = "SNS topic ARN used for RDS failure alerts"
  type        = string
}