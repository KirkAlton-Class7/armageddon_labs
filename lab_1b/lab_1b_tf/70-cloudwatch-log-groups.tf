# CWL Group - VPC Traffic
resource "aws_cloudwatch_log_group" "vpc_flow_log" {
  name = "vpc-flow-log"

  tags = {
    Name        = "vpc-flow-log"
    App         = "${local.application}"
    Environment = "${local.environment}"
    Component   = "logs-vpc"
    Scope       = "logging-conectivity"
    DataClass   = "confidential"
  }
}

# CWL Group - LabMySQL Auth Failures
resource "aws_cloudwatch_log_group" "lab_mysql_auth_failure_logs" {
  name = "/aws/rds/instance/lab-mysql-${local.name_suffix}/error"

  tags = {
    Name        = "auth-failure-flow-log"
    App         = "${local.application}"
    Environment = "${local.environment}"
    Component   = "logs-db"
    Scope       = "logging-login"
    DataClass   = "confidential"
  }
}