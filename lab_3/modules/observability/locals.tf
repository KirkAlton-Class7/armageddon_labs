# ----------------------------------------------------------------
# OBSERVABILITY — LOCALS
# ----------------------------------------------------------------

locals {

  # ----------------------------------------------------------------
  # LOGGING — WAF Destination Resolution
  # ----------------------------------------------------------------
  # Resolve WAF log destination ARN.
  # Kept separate from waf_log_mode to avoid dependency cycles.

  waf_log_destination_arn = (
    var.waf_log_mode.target == "cloudwatch" ? aws_cloudwatch_log_group.waf_logs[0].arn :
    var.waf_log_mode.target == "firehose" ? aws_kinesis_firehose_delivery_stream.network_telemetry[0].arn :
    var.waf_log_mode.target == "s3" ? aws_s3_bucket.waf_logs_bucket[0].arn :
    error("Invalid WAF log destination target.")
  )

  # Ternary operator syntax:
  # condition ? value_if_true : value_if_false
  # Everything must evaluate to ONE value.

  # ----------------------------------------------------------------
  # DASHBOARDS — Conditional WAF Widget (CloudFront)
  # ----------------------------------------------------------------
  # Render only if WAF exists (CloudWatch rejects null dimensions)

  waf_widget = var.rds_app_waf_name != null ? [
    {
      type   = "metric"
      x      = 0
      y      = 6
      width  = 8
      height = 6

      properties = {
        title = "CloudFront WAF Blocked Requests"

        metrics = [
          [
            "AWS/WAFV2",
            "BlockedRequests",
            "WebACL", var.rds_app_waf_name,
            "Region", "Global",
            "Rule", "ALL"
          ]
        ]

        region = "us-east-1"
        period = 300
        view   = "timeSeries"
      }
    }
  ] : []
}