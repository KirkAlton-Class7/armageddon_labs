# ----------------------------------------------------------------
# OBSERVABILITY — WAF Logging Configuration (Direct Delivery)
# ----------------------------------------------------------------

resource "aws_wafv2_web_acl_logging_configuration" "rds_app_waf_direct" {
  provider = aws.regional

  count    = var.create_waf && var.waf_log_mode.create_direct_resources ? 1 : 0

  resource_arn = aws_wafv2_web_acl.rds_app[0].arn

  log_destination_configs = [
    var.waf_log_destination_arn
  ]
}

# When using count, Terraform transforms this resource into a LIST.
# The resource must be accessed by index:
# If count = 0, the resource does not exist and direct indexing will fail.
# Consider using try() to safely reference attributes when a resource is conditional.
# try(aws_wafv2_web_acl_logging_configuration.rds_app_waf_direct[0].arn, null)

# ----------------------------------------------------------------
# OBSERVABILITY — WAF Logging Configuration (Firehose Delivery)
# ----------------------------------------------------------------

resource "aws_wafv2_web_acl_logging_configuration" "rds_app_waf_firehose" {
  provider = aws.regional
  
  count = var.create_waf && var.waf_log_mode.create_firehose_resources ? 1 : 0

  resource_arn = aws_wafv2_web_acl.rds_app[0].arn

  log_destination_configs = [
    var.waf_log_destination_arn
  ]
}