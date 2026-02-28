locals {
  # Locals for Rendering Template Files

  # EC2 User Data for RDS App Instances
  rds_app_user_data = templatefile("${path.module}/templates/1c_user_data.sh.tpl",
    {
      region      = var.context.region,
      secret_id   = var.secret_arn
      name_suffix = var.name_suffix
    }
  )

  # CloudWatch Agent Configuration File
  cloudwatch_agent_config = templatefile("${path.module}/templates/cloudwatch-agent-config.json.tpl",
    {
      name_suffix = var.name_suffix
    }
  )
}


# -------------------------------------------------------------------
# ALB Logging Configuration
# -------------------------------------------------------------------
# alb_log_mode = var.enable_alb_access_logs
