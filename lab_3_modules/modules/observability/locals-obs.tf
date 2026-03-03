locals{
      # Resolve WAF Log Destination ARN
  # Kept separate from waf_log_modes to avoid dependency cycles.
  waf_log_destination_arn = (
    var.waf_log_mode.target == "cloudwatch" ? aws_cloudwatch_log_group.waf_logs[0].arn :
    var.waf_log_mode.target == "firehose" ? aws_kinesis_firehose_delivery_stream.network_telemetry[0].arn :
    var.waf_log_mode.target == "s3" ? aws_s3_bucket.waf_logs_bucket[0].arn :
    error("Invalid WAF olg destination target.")
  )
  # ? : Is the ternary conditional operator. condition ? value_if_true : value_if_false
  # Remember, everything in an expression () evaluates to ONE value.

}