# ----------------------------------------------------------------
# OUTPUTS — Logging & Observability
# ----------------------------------------------------------------

# Logging Info
# Maps in maps is helpful but slants in CLI.
output "logging_info" {
  description = "Logging configuration, resources, and log destinations."

  value = {
    alb_access_logs = {
      enabled = local.alb_log_mode
      bucket = {
        name = try(aws_s3_bucket.alb_logs_bucket[0].bucket, null)
        arn  = try(aws_s3_bucket.alb_logs_bucket[0].arn, null)
      }
      prefix = local.alb_log_mode ? var.alb_access_logs_prefix : null
    }

    waf_direct_logs = {
      enabled = local.waf_log_mode.create_direct_resources
      bucket = {
        name = try(aws_s3_bucket.waf_logs_bucket[0].bucket, null)
        arn  = try(aws_s3_bucket.waf_logs_bucket[0].arn, null)
      }
    }

    waf_firehose_logs = {
      enabled = local.waf_log_mode.create_firehose_resources

      firehose = {
        name = try(aws_kinesis_firehose_delivery_stream.network_telemetry[0].name, null)
        arn  = try(aws_kinesis_firehose_delivery_stream.network_telemetry[0].arn, null)
      }

      firehose_destination = {
        bucket_arn = try(aws_s3_bucket.waf_firehose_logs[0].arn, null)
        prefix     = local.waf_log_mode.create_firehose_resources ? "waf-logs/" : null
      }

      cloudwath_log_groups = {
        cloudwatch_log_groups = {
          vpc_flow_logs = {
            name = aws_cloudwatch_log_group.vpc_flow_log.name
            arn  = aws_cloudwatch_log_group.vpc_flow_log.arn
          }

          waf_direct_logs = {
            enabled = local.waf_log_mode.create_direct_resources
            name    = try(aws_cloudwatch_log_group.waf_logs[0].name, null)
            arn     = try(aws_cloudwatch_log_group.waf_logs[0].arn, null)
          }

          waf_firehose_logs = {
            enabled = local.waf_log_mode.create_firehose_resources
            name    = try(aws_cloudwatch_log_group.waf_firehose_logs[0].name, null)
            arn     = try(aws_cloudwatch_log_group.waf_firehose_logs[0].arn, null)
          }
        }
      }
    }
  }
}