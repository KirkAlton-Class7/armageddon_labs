# ----------------------------------------------------------------
# OUTPUTS — Logging & Observability
# ----------------------------------------------------------------




output "vpc_flow_log_group_arn" {
  value = aws_cloudwatch_log_group.vpc_flow_log.arn

}


# ----------------------------------------------------------------
# OUTPUT — WAF Firehose Log Group ARN
# ----------------------------------------------------------------
output "waf_firehose_log_group_arn" {
  description = "ARN of the WAF Firehose CloudWatch log group"
  value       = try(aws_cloudwatch_log_group.waf_firehose_logs[0].arn, null)
}


# ----------------------------------------------------------------
# OUTPUT — WAF Direct Log Group ARN
# ----------------------------------------------------------------
output "waf_direct_log_group_arn" {
  description = "ARN of the WAF direct CloudWatch log group"
  value       = try(aws_cloudwatch_log_group.waf_logs[0].arn, null)
}


output "waf_log_destination_arn" {
  value = local.waf_log_destination_arn
}









output "alb_logs_bucket_id" {
  description = "ID of the ALB logs S3 bucket (if created)"
  value       = try(aws_s3_bucket.alb_logs_bucket[0].id, null)
}



output "alb_logs_bucket_arn" {
  description = "ARN of the ALB logs S3 bucket (if created)"
  value       = try(aws_s3_bucket.alb_logs_bucket[0].arn, null)
}


output "alb_logs_bucket_name" {
  description = "Name of the ALB logs S3 bucket (if created)"
  value       = try(aws_s3_bucket.alb_logs_bucket[0].bucket, null)
}



# variable "alb_logs_bucket_id" {
#   description = "ID of ALB logs S3 bucket (null if disabled)"
#   type        = string
#   default     = null
# }


# variable "alb_logs_bucket_arn" {
#   description = "ARN of ALB logs S3 bucket (null if disabled)"
#   type        = string
#   default     = null
# }


# variable "alb_logs_bucket_name" {
#   description = "Name of ALB logs S3 bucket (null if disabled)"
#   type        = string
#   default     = null
# }









# ----------------------------------------------------------------
# OUTPUT — WAF Firehose Logs Bucket Name
# ----------------------------------------------------------------
output "waf_firehose_logs_bucket_name" {
  description = "Name of the S3 bucket used for WAF Firehose logs"
  value       = try(aws_s3_bucket.waf_firehose_logs[0].bucket, null)
}

# ----------------------------------------------------------------
# OUTPUT — WAF Firehose Logs Bucket ARN
# ----------------------------------------------------------------
output "waf_firehose_logs_bucket_arn" {
  description = "ARN of the S3 bucket used for WAF Firehose logs"
  value       = try(aws_s3_bucket.waf_firehose_logs[0].arn, null)
}

# ----------------------------------------------------------------
# OUTPUT — WAF Firehose Logs Bucket ID
# ----------------------------------------------------------------
output "waf_firehose_logs_bucket_id" {
  description = "ID of the S3 bucket used for WAF Firehose logs"
  value       = try(aws_s3_bucket.waf_firehose_logs[0].id, null)
}




# ----------------------------------------------------------------
# VARIABLE — WAF Firehose Logs Bucket Name
# ----------------------------------------------------------------
# variable "waf_firehose_logs_bucket_name" {
#   description = "Name of the S3 bucket used for WAF Firehose logs"
#   type        = string
#   default     = null
# }

# ----------------------------------------------------------------
# VARIABLE — WAF Firehose Logs Bucket ARN
# ----------------------------------------------------------------
# variable "waf_firehose_logs_bucket_arn" {
#   description = "ARN of the S3 bucket used for WAF Firehose logs"
#   type        = string
#   default     = null
# }

# ----------------------------------------------------------------
# VARIABLE — WAF Firehose Logs Bucket ID
# ----------------------------------------------------------------
# variable "waf_firehose_logs_bucket_id" {
#   description = "ID of the S3 bucket used for WAF Firehose logs"
#   type        = string
#   default     = null
# }


  # waf_firehose_logs_bucket_name = module.observability.waf_firehose_logs_bucket_name
  # waf_firehose_logs_bucket_arn  = module.observability.waf_firehose_logs_bucket_arn
  # waf_firehose_logs_bucket_id   = module.observability.waf_firehose_logs_bucket_id











# ----------------------------------------------------------------
# OUTPUT — RDS Failure Alert Topic ARN
# ----------------------------------------------------------------
output "rds_failure_alert_topic_arn" {
  description = "ARN of SNS topic for RDS failure alerts"
  value       = aws_sns_topic.rds_failure_alert.arn
}

# ----------------------------------------------------------------
# OUTPUT — App → RDS Connection Failure Alert Topic ARN
# ----------------------------------------------------------------
output "app_to_rds_connection_failure_alert_topic_arn" {
  description = "ARN of SNS topic for application-to-database connectivity alerts"
  value       = aws_sns_topic.app_to_rds_connection_failure_alert.arn
}

# ----------------------------------------------------------------
# OUTPUT — MySQL Authentication Failure Alert Topic ARN
# ----------------------------------------------------------------
output "lab_mysql_auth_failure_alert_topic_arn" {
  description = "ARN of SNS topic for database authentication failure alerts"
  value       = aws_sns_topic.lab_mysql_auth_failure_alert.arn
}

# ----------------------------------------------------------------
# OUTPUT — ALB Server Error Alert Topic ARN
# ----------------------------------------------------------------
output "rds_app_alb_server_error_alert_topic_arn" {
  description = "ARN of SNS topic for ALB 5xx server error alerts"
  value       = aws_sns_topic.rds_app_alb_server_error_alert.arn
}

# ----------------------------------------------------------------
# VARIABLE — RDS Failure Alert Topic ARN
# ----------------------------------------------------------------
# variable "rds_failure_alert_topic_arn" {
#   description = "SNS topic ARN used for RDS failure alerts"
#   type        = string
# }

# ----------------------------------------------------------------
# VARIABLE — App → RDS Connection Failure Alert Topic ARN
# ----------------------------------------------------------------
# variable "app_to_rds_connection_failure_alert_topic_arn" {
#   description = "SNS topic ARN used for application-to-database connectivity alerts"
#   type        = string
# }

# ----------------------------------------------------------------
# VARIABLE — MySQL Authentication Failure Alert Topic ARN
# ----------------------------------------------------------------
# variable "lab_mysql_auth_failure_alert_topic_arn" {
#   description = "SNS topic ARN used for database authentication failure alerts"
#   type        = string
# }

# ----------------------------------------------------------------
# VARIABLE — ALB Server Error Alert Topic ARN
# ----------------------------------------------------------------
# variable "rds_app_alb_server_error_alert_topic_arn" {
#   description = "SNS topic ARN used for ALB server error alerts"
#   type        = string
# }


  # rds_failure_alert_topic_arn                     = module.alerting.rds_failure_alert_topic_arn
  # app_to_rds_connection_failure_alert_topic_arn  = module.alerting.app_to_rds_connection_failure_alert_topic_arn
  # lab_mysql_auth_failure_alert_topic_arn         = module.alerting.lab_mysql_auth_failure_alert_topic_arn
  # rds_app_alb_server_error_alert_topic_arn       = module.alerting.rds_app_alb_server_error_alert_topic_arn







# Logging Info
# Maps in maps is helpful but slants in CLI.
output "logging_info" {
  description = "Logging configuration, resources, and log destinations."

  value = {
    alb_access_logs = {
      enabled = var.alb_log_s3
      bucket = {
        name = try(aws_s3_bucket.alb_logs_bucket[0].bucket, null)
        arn  = try(aws_s3_bucket.alb_logs_bucket[0].arn, null)
      }
      prefix = var.alb_log_s3 ? var.alb_access_logs_prefix : null
    }

    waf_direct_logs = {
      enabled = var.waf_log_mode.create_direct_resources
      bucket = {
        name = try(aws_s3_bucket.waf_logs_bucket[0].bucket, null)
        arn  = try(aws_s3_bucket.waf_logs_bucket[0].arn, null)
      }
    }

    waf_firehose_logs = {
      enabled = var.waf_log_mode.create_firehose_resources

      firehose = {
        name = try(aws_kinesis_firehose_delivery_stream.network_telemetry[0].name, null)
        arn  = try(aws_kinesis_firehose_delivery_stream.network_telemetry[0].arn, null)
      }

      firehose_destination = {
        bucket_arn = try(aws_s3_bucket.waf_firehose_logs[0].arn, null)
        prefix     = var.waf_log_mode.create_firehose_resources ? "waf-logs/" : null
      }

      cloudwath_log_groups = {
        cloudwatch_log_groups = {
          vpc_flow_logs = {
            name = aws_cloudwatch_log_group.vpc_flow_log.name
            arn  = aws_cloudwatch_log_group.vpc_flow_log.arn
          }

          waf_direct_logs = {
            enabled = var.waf_log_mode.create_direct_resources
            name    = try(aws_cloudwatch_log_group.waf_logs[0].name, null)
            arn     = try(aws_cloudwatch_log_group.waf_logs[0].arn, null)
          }

          waf_firehose_logs = {
            enabled = var.waf_log_mode.create_firehose_resources
            name    = try(aws_cloudwatch_log_group.waf_firehose_logs[0].name, null)
            arn     = try(aws_cloudwatch_log_group.waf_firehose_logs[0].arn, null)
          }
        }
      }
    }
  }
}