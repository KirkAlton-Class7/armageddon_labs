# ----------------------------------------------------------------
# OUTPUTS — Security Groups
# ----------------------------------------------------------------
output "alb_sg_id" {
  value = module.aws_security_group.alb_origin.id
}

output "db_sg_id" {
  value = module.aws_security_group.private_db.id
}


# ----------------------------------------------------------------
# OUTPUTS — Security WAF
# ----------------------------------------------------------------

# WAF Info
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