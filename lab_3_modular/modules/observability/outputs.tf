# ----------------------------------------------------------------
# OBSERVABILITY — VPC Flow Logs
# ----------------------------------------------------------------

output "vpc_flow_log_group_arn" {
  value = aws_cloudwatch_log_group.vpc_flow_log.arn
}

# ----------------------------------------------------------------
# OBSERVABILITY — WAF CloudWatch Log Groups
# ----------------------------------------------------------------

output "waf_firehose_log_group_arn" {
  description = "ARN of the WAF Firehose CloudWatch log group"
  value       = try(aws_cloudwatch_log_group.waf_firehose_logs[0].arn, null)
}

output "waf_direct_log_group_arn" {
  description = "ARN of the WAF direct CloudWatch log group"
  value       = try(aws_cloudwatch_log_group.waf_logs[0].arn, null)
}

output "waf_log_destination_arn" {
  value = local.waf_log_destination_arn
}

# ----------------------------------------------------------------
# OBSERVABILITY — ALB Access Logs S3 Bucket
# ----------------------------------------------------------------

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

# ----------------------------------------------------------------
# OBSERVABILITY — WAF Firehose Logs S3 Bucket
# ----------------------------------------------------------------

output "waf_firehose_logs_bucket_name" {
  description = "Name of the S3 bucket used for WAF Firehose logs"
  value       = try(aws_s3_bucket.waf_firehose_logs[0].bucket, null)
}

output "waf_firehose_logs_bucket_arn" {
  description = "ARN of the S3 bucket used for WAF Firehose logs"
  value       = try(aws_s3_bucket.waf_firehose_logs[0].arn, null)
}

output "waf_firehose_logs_bucket_id" {
  description = "ID of the S3 bucket used for WAF Firehose logs"
  value       = try(aws_s3_bucket.waf_firehose_logs[0].id, null)
}

# ----------------------------------------------------------------
# OBSERVABILITY — Alerting SNS Topics
# ----------------------------------------------------------------

output "rds_failure_alert_topic_arn" {
  description = "ARN of SNS topic for RDS failure alerts"
  value       = aws_sns_topic.rds_failure_alert.arn
}

output "app_to_rds_connection_failure_alert_topic_arn" {
  description = "ARN of SNS topic for application-to-database connectivity alerts"
  value       = aws_sns_topic.app_to_rds_connection_failure_alert.arn
}

output "lab_mysql_auth_failure_alert_topic_arn" {
  description = "ARN of SNS topic for database authentication failure alerts"
  value       = aws_sns_topic.lab_mysql_auth_failure_alert.arn
}

output "rds_app_alb_server_error_alert_topic_arn" {
  description = "ARN of SNS topic for ALB 5xx server error alerts"
  value       = aws_sns_topic.rds_app_alb_server_error_alert.arn
}

# ----------------------------------------------------------------
# OBSERVABILITY — Logging Configuration Summary
# ----------------------------------------------------------------

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