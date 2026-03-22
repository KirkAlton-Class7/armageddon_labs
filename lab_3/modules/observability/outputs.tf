# ----------------------------------------------------------------
# OBSERVABILITY — OUTPUTS
# ----------------------------------------------------------------

# ----------------------------------------------------------------
# OUTPUTS — VPC Flow Logs
# ----------------------------------------------------------------

output "vpc_flow_log_group_arn" {
  description = "CloudWatch log group ARN for VPC flow logs."
  value       = aws_cloudwatch_log_group.vpc_flow_log.arn
}

# ----------------------------------------------------------------
# OUTPUTS — WAF Logs
# ----------------------------------------------------------------

output "waf_firehose_log_group_arn" {
  description = "CloudWatch log group ARN for WAF Firehose logging."
  value       = try(aws_cloudwatch_log_group.waf_firehose_logs[0].arn, null)
}

output "waf_direct_log_group_arn" {
  description = "CloudWatch log group ARN for direct WAF logging."
  value       = try(aws_cloudwatch_log_group.waf_logs[0].arn, null)
}

output "waf_log_destination_arn" {
  description = "Resolved WAF log destination ARN."
  value       = local.waf_log_destination_arn
}