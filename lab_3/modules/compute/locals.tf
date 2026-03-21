# ----------------------------------------------------------------
# COMPUTE — Locals
# ----------------------------------------------------------------

locals {
  # Locals for Rendering Template Files

  # EC2 User Data for RDS App Instances
  rds_app_user_data = templatefile(
    "${path.module}/templates/1c-user-data.sh.tpl",
    {
      region      = var.context.region,
      secret_id   = var.db_secret_arn,
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

  # ----------------------------------------------------------------
  # LOCALS — ACM Certificate Validation Options
  # ----------------------------------------------------------------
  # Convert set → list and select first validation option (root/wildcard share validation)
  # Ensures deterministic plan without dynamic for_each
  # https://fivexl.io/blog/aws_acm_certificate/

  rds_app_certificate_validation_options = tolist(aws_acm_certificate.rds_app_cert.domain_validation_options)[0]
}