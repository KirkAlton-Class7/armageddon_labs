# ----------------------------------------------------------------
# SECURITY OUTPUTS — Application Security Groups
# ----------------------------------------------------------------

output "rds_app_asg_sg_id" {
  description = "Security group ID for the RDS app Auto Scaling Group."
  value       = aws_security_group.rds_app_asg.id
}

output "alb_origin_sg_id" {
  description = "Security group ID for the ALB origin."
  value       = aws_security_group.alb_origin.id
}

output "private_db_sg_id" {
  description = "Security group ID for the private database."
  value       = aws_security_group.private_db.id
}

# ----------------------------------------------------------------
# SECURITY OUTPUTS — Service Log Delivery Configuration
# ----------------------------------------------------------------

output "enable_direct_service_log_delivery" {
  description = "Whether direct AWS service log delivery is enabled."
  value       = var.enable_direct_service_log_delivery
}

# ----------------------------------------------------------------
# SECURITY OUTPUTS — WAF Web ACL Summary
# ----------------------------------------------------------------

output "waf_info" {
  description = "WAF Web ACL details."

  value = var.create_waf ? {
    name  = aws_wafv2_web_acl.rds_app[0].name
    arn   = aws_wafv2_web_acl.rds_app[0].arn
    scope = aws_wafv2_web_acl.rds_app[0].scope

    rules = [
      for rule in aws_wafv2_web_acl.rds_app[0].rule : {
        name     = rule.name
        priority = rule.priority
        metric   = rule.visibility_config[0].metric_name
        managed_rule_group = try(
          rule.statement[0].managed_rule_group_statement[0].name,
          null
        )
      }
    ]
  } : null
}

# ----------------------------------------------------------------
# SECURITY OUTPUTS — WAF Web ACL Identifiers
# ----------------------------------------------------------------

output "rds_app_waf_arn" {
  description = "ARN of the RDS app WAF web ACL."
  value       = var.create_waf ? aws_wafv2_web_acl.rds_app[0].arn : null
}

output "rds_app_waf_id" {
  description = "ID of the RDS app WAF web ACL."
  value       = var.create_waf ? aws_wafv2_web_acl.rds_app[0].id : null
}

output "rds_app_waf_name" {
  description = "Name of the RDS app WAF web ACL."
  value       = var.create_waf ? aws_wafv2_web_acl.rds_app[0].name : null
}

output "rds_app_waf_capacity" {
  description = "WAF capacity units used by the ACL."
  value       = var.create_waf ? aws_wafv2_web_acl.rds_app[0].capacity : null
}