# ----------------------------------------------------------------
# DATABASE VARIABLES — Application Context
# ----------------------------------------------------------------

variable "context" {
  description = "Deployment context containing region, application name, environment, and common tags."
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
  description = "Prefix for resource names."
  type        = string
}

variable "name_suffix" {
  description = "Suffix for resource names."
  type        = string
}

# ----------------------------------------------------------------
# DATABASE VARIABLES — Networking
# ----------------------------------------------------------------

variable "private_app_subnet_ids" {
  description = "Private application subnet IDs."
  type        = list(string)
}

variable "private_data_subnet_ids" {
  description = "Private data subnet IDs."
  type        = list(string)
}

variable "private_app_subnet_tags" {
  description = "Tags applied to private application subnet resources."
  type        = map(string)
}

variable "private_data_subnet_tags" {
  description = "Tags applied to private data subnet resources."
  type        = map(string)
}

# ----------------------------------------------------------------
# DATABASE VARIABLES — Security Groups
# ----------------------------------------------------------------

variable "private_db_sg_id" {
  description = "Security group ID for the private database."
  type        = string
}

# ----------------------------------------------------------------
# DATABASE VARIABLES — Database Configuration
# ----------------------------------------------------------------

variable "db_engine" {
  description = "Database engine type."
  type        = string
}

variable "db_username" {
  description = "Database admin username."
  type        = string
}

variable "db_secret_arn" {
  description = "Secrets Manager ARN containing database credentials."
  type        = string
}

# ----------------------------------------------------------------
# DATABASE VARIABLES — Monitoring & Alerting
# ----------------------------------------------------------------

variable "rds_enhanced_monitoring_role_arn" {
  description = "IAM role ARN for RDS enhanced monitoring."
  type        = string
}

variable "rds_failure_alert_topic_arn" {
  description = "SNS topic ARN for RDS failure alerts."
  type        = string
}