# ----------------------------------------------------------------
# COMPUTE — Locals
# ----------------------------------------------------------------

locals {
  # Locals for Rendering Template Files

  # EC2 User Data for RDS App Instances
  rds_app_user_data = templatefile("${path.module}/templates/1c_user_data.sh.tpl",
    {
      region      = var.context.region,
      secret_id   = var.db_secret_arn
      name_suffix = var.name_suffix
    }
  )

  # AMI Map
  ami_map = {
  ap-northeast-1 = "ami-aaa111" # Tokyo (replace with your AMI ID)
  sa-east-1      = "ami-bbb222" # São Paulo (replace with your AMI ID)
}

  # CloudWatch Agent Configuration File
  cloudwatch_agent_config = templatefile("${path.module}/templates/cloudwatch-agent-config.json.tpl",
    {
      name_suffix = var.name_suffix
    }
  )
}