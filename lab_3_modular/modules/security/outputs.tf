# ----------------------------------------------------------------
# SECURITY OUTPUTS — VPC Endpoints Security Group
# ----------------------------------------------------------------

output "vpc_endpoints_sg_id" {
  description = "Security Group ID for VPC endpoints"
  value       = aws_security_group.vpc_endpoints.id
}

output "vpc_endpoints_sg_arn" {
  description = "Security Group ARN for VPC endpoints"
  value       = aws_security_group.vpc_endpoints.arn
}

output "vpc_endpoints_sg_name" {
  description = "Security Group name for VPC endpoints"
  value       = aws_security_group.vpc_endpoints.name
}

# ----------------------------------------------------------------
# SECURITY OUTPUTS — Application Security Groups
# ----------------------------------------------------------------

output "rds_app_asg_sg_id" {
  description = "Security Group ID for the RDS App Auto Scaling Group"
  value       = aws_security_group.rds_app_asg.id
}

output "alb_origin_sg_id" {
  description = "Security Group ID for the ALB origin"
  value       = aws_security_group.alb_origin.id
}

output "private_db_sg_id" {
  description = "Security Group ID for the private database"
  value       = aws_security_group.private_db.id
}

# ----------------------------------------------------------------
# SECURITY OUTPUTS — Service Log Delivery Configuration
# ----------------------------------------------------------------

output "enable_direct_service_log_delivery" {
  description = "Indicates whether direct AWS service log delivery is enabled"
  value       = var.enable_direct_service_log_delivery
}

# ----------------------------------------------------------------
# SECURITY OUTPUTS — WAF Web ACL Summary
# ----------------------------------------------------------------

# WAF Info - Contract + Operator
output "waf_info" {
  description = "WAF Web ACL details"

  value = {
    name  = aws_wafv2_web_acl.rds_app.name
    arn   = aws_wafv2_web_acl.rds_app.arn
    scope = aws_wafv2_web_acl.rds_app.scope

    rules = [
      for rule in aws_wafv2_web_acl.rds_app.rule : {
        name     = rule.name
        priority = rule.priority
        metric   = rule.visibility_config[0].metric_name
        managed_rule_group = try(
          rule.statement[0].managed_rule_group_statement[0].name,
          null
        )
      }
    ]
  }
}

# ----------------------------------------------------------------
# SECURITY OUTPUTS — WAF Web ACL Identifiers
# ----------------------------------------------------------------

output "rds_app_waf_arn" {
  description = "ARN of the RDS App WAF Web ACL"
  value       = aws_wafv2_web_acl.rds_app.arn
}

output "rds_app_waf_id" {
  description = "Unique ID of the RDS App WAF Web ACL"
  value       = aws_wafv2_web_acl.rds_app.id
}

output "rds_app_waf_name" {
  description = "Name of the RDS App WAF Web ACL"
  value       = aws_wafv2_web_acl.rds_app.name
}

output "rds_app_waf_capacity" {
  description = "WAF capacity units used by this ACL"
  value       = aws_wafv2_web_acl.rds_app.capacity
}