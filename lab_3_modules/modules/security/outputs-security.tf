

# ----------------------------------------------------------------
# OUTPUT — VPC Endpoints Security Group ID
# ----------------------------------------------------------------
output "vpc_endpoints_sg_id" {
  description = "Security Group ID for VPC endpoints"
  value       = aws_security_group.vpc_endpoints.id
}

# ----------------------------------------------------------------
# OUTPUT — VPC Endpoints Security Group ARN
# ----------------------------------------------------------------
output "vpc_endpoints_sg_arn" {
  description = "Security Group ARN for VPC endpoints"
  value       = aws_security_group.vpc_endpoints.arn
}

# ----------------------------------------------------------------
# OUTPUT — VPC Endpoints Security Group Name
# ----------------------------------------------------------------
output "vpc_endpoints_sg_name" {
  description = "Security Group name for VPC endpoints"
  value       = aws_security_group.vpc_endpoints.name
}


# ASG SG ID
output "rds_app_asg_sg_id" {
  value = aws_security_group.rds_app_asg.id
}

# ALB SG ID
output "alb_origin_sg_id" {
  value = aws_security_group.alb_origin.id
}

# DB SG ID
output "private_db_sg_id" {
  value = aws_security_group.private_db.id
}

output "enable_direct_service_log_delivery" {
  value = var.enable_direct_service_log_delivery
}



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
# OUTPUT — WAF Web ACL ARN
# ----------------------------------------------------------------
output "rds_app_waf_arn" {
  description = "ARN of the RDS App WAF Web ACL"
  value       = aws_wafv2_web_acl.rds_app.arn
}

# ----------------------------------------------------------------
# OUTPUT — WAF Web ACL ID
# ----------------------------------------------------------------
output "rds_app_waf_id" {
  description = "Unique ID of the RDS App WAF Web ACL"
  value       = aws_wafv2_web_acl.rds_app.id
}

# ----------------------------------------------------------------
# OUTPUT — WAF Web ACL Name
# ----------------------------------------------------------------
output "rds_app_waf_name" {
  description = "Name of the RDS App WAF Web ACL"
  value       = aws_wafv2_web_acl.rds_app.name
}

# ----------------------------------------------------------------
# OUTPUT — WAF Web ACL Capacity
# ----------------------------------------------------------------
output "rds_app_waf_capacity" {
  description = "WAF capacity units used by this ACL"
  value       = aws_wafv2_web_acl.rds_app.capacity
}

  # rds_app_waf_arn      = module.security.rds_app_waf_arn
  # rds_app_waf_id       = module.security.rds_app_waf_id
  # rds_app_waf_name     = module.security.rds_app_waf_name
  # rds_app_waf_capacity = module.security.rds_app_waf_capacity

# # ----------------------------------------------------------------
# # INPUT — WAF Web ACL ARN
# # ----------------------------------------------------------------
# variable "rds_app_waf_arn" {
#   description = "ARN of the RDS App WAF Web ACL"
#   type        = string
# }

# # ----------------------------------------------------------------
# # INPUT — WAF Web ACL ID
# # ----------------------------------------------------------------
# variable "rds_app_waf_id" {
#   description = "Unique ID of the RDS App WAF Web ACL"
#   type        = string
# }

# # ----------------------------------------------------------------
# # INPUT — WAF Web ACL Name
# # ----------------------------------------------------------------
# variable "rds_app_waf_name" {
#   description = "Name of the RDS App WAF Web ACL"
#   type        = string
# }

# # ----------------------------------------------------------------
# # INPUT — WAF Web ACL Capacity
# # ----------------------------------------------------------------
# variable "rds_app_waf_capacity" {
#   description = "WAF capacity units used by the ACL"
#   type        = number
# }