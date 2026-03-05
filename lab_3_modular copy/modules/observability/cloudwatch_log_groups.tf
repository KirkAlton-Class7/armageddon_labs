# ----------------------------------------------------------------
# OBSERVABILITY — Cloudwatch Log Groups (Network)
# ----------------------------------------------------------------

# CWL Group - VPC Traffic
resource "aws_cloudwatch_log_group" "vpc_flow_log" {
  name              = "vpc-flow-log-${var.name_suffix}"
  retention_in_days = 1

  tags = {
    Name        = "vpc-flow-log"
    App         = "${var.context.app}"
    Environment = "${var.context.env}"
    Component   = "logs-vpc"
    Scope       = "logging-conectivity"
    DataClass   = "confidential"
  }
}


# ----------------------------------------------------------------
# OBSERVABILITY — Cloudwatch Log Groups (Application / ALB)
# ----------------------------------------------------------------

# CWL Group - RDS App ALB Logs
resource "aws_cloudwatch_log_group" "rds_app_alb_server_error" {
  name              = "rds-app-alb-server-error-${var.name_suffix}"
  retention_in_days = 1

  tags = {
    Name        = "rds-app-alb-server-error"
    App         = "${var.context.app}"
    Environment = "${var.context.env}"
    Component   = "logs-alb"
    Scope       = "logging-backend"
    DataClass   = "confidential"
  }
}


# ----------------------------------------------------------------
# OBSERVABILITY — Cloudwatch Log Groups (Security — WAF Direct)
# ----------------------------------------------------------------

# Conditional CWL Group - WAF Logs
resource "aws_cloudwatch_log_group" "waf_logs" {
  count             = var.waf_log_mode.create_direct_resources ? 1 : 0
  provider          = aws.global
  name              = "aws-waf-logs-${var.context.env}-${var.bucket_suffix}"
  retention_in_days = 1

  tags = {
    Name        = "waf-logs-network-telemetry"
    App         = "${var.context.app}"
    Environment = "${var.context.env}"
    Component   = "logs-waf"
    Scope       = "logging-security-edge"
    DataClass   = "confidential"
  }
}


# ----------------------------------------------------------------
# OBSERVABILITY — Cloudwatch Log Groups (Security — WAF Firehose)
# ----------------------------------------------------------------

# Firehose logging
resource "aws_cloudwatch_log_group" "waf_firehose_logs" {
  count = var.waf_log_mode.create_firehose_resources ? 1 : 0

  name              = "aws-waf-logs-firehose-${var.context.env}-${var.bucket_suffix}"
  retention_in_days = 1

  tags = {
    Name        = "waf-firehose-logs"
    App         = "${var.context.app}"
    Environment = "${var.context.env}"
    Component   = "logs-waf"
    Scope       = "logging-security-edge"
    DataClass   = "confidential"
  }
}