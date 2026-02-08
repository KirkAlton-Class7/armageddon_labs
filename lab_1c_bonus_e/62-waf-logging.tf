# WAF Web ACL Logging Configuration
resource "aws_wafv2_web_acl_logging_configuration" "rds_app_waf" {
  log_destination_configs = [
    aws_kinesis_firehose_delivery_stream.network_telemetry.arn
  #aws_cloudwatch_log_group.waf_logs.arn
  ]

  resource_arn = aws_wafv2_web_acl.rds_app.arn

  # # Redacted Fields
  # redacted_fields {
  #   single_header {
  #     name = "user-agent"
  #   }
  # }

  # # Logging Filter
  # logging_filter {
  #   default_behavior = "KEEP"

  #   filter {
  #     behavior = "DROP"

  #     condition {
  #       action_condition {
  #         action = "COUNT"
  #       }
  #     }

  #     condition {
  #       label_name_condition {
  #         label_name = "awswaf:111122223333:rulegroup:testRules:LabelNameZ"
  #       }
  #     }

  #     requirement = "MEETS_ALL"
  #   }

  #   filter {
  #     behavior = "KEEP"

  #     condition {
  #       action_condition {
  #         action = "ALLOW"
  #       }
  #     }

  #     requirement = "MEETS_ANY"
  #   }
  # }
}