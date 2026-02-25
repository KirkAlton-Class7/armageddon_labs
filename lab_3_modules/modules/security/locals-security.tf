locals {
  # -------------------------------------------------------------------
  # ALB Logging Configuration
  # -------------------------------------------------------------------
  alb_log_mode = var.enable_alb_access_logs

  # -------------------------------------------------------------------
  # WAF Logging Configuration
  # -------------------------------------------------------------------
  # WAF Log Mode Definitions
  waf_log_modes = {
    cloudwatch = {
      create_direct_resources   = true
      create_firehose_resources = false
      target                    = "cloudwatch"
    }

    firehose = {
      create_direct_resources   = false
      create_firehose_resources = true
      target                    = "firehose"
    }

    s3 = {
      create_direct_resources   = true
      create_firehose_resources = false
      target                    = "s3"
    }
  }

  # WAF Log Mode Selection
  waf_log_mode = local.waf_log_modes[var.waf_log_destination]

  # Resolve WAF Log Destination ARN
  # Kept separate from waf_log_modes to avoid dependency cycles.
  waf_log_destination_arn = (
    local.waf_log_mode.target == "cloudwatch" ? aws_cloudwatch_log_group.waf_logs[0].arn :
    local.waf_log_mode.target == "firehose" ? aws_kinesis_firehose_delivery_stream.network_telemetry[0].arn :
    local.waf_log_mode.target == "s3" ? aws_s3_bucket.waf_logs_bucket[0].arn :
    null
  )
  # ? : Is the ternary conditional operator. condition ? value_if_true : value_if_false
  # Remember, everything in an expression () evaluates to ONE value.

  # -------------------------------------------------------------------
  # Validation & Safety Logic
  # -------------------------------------------------------------------
  # WAF Log Mode Validation Logic
  # This will be false if both log modes are true.
  # A check against this value gives an error to prevent issues on apply.
  waf_log_mode_valid = (local.waf_log_mode.create_direct_resources && !local.waf_log_mode.create_firehose_resources) || (!local.waf_log_mode.create_direct_resources && local.waf_log_mode.create_firehose_resources)
}

locals {
  # Edge Authentication Header Name
  edge_auth_header_name = "X-${local.name_prefix}-edge-auth-v1" # Cycle versions as needed
}