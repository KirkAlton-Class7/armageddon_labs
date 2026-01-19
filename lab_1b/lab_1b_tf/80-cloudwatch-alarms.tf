# CloudWatch Alarm - Public App to MySQL Connection Failure
# Metric
resource "aws_cloudwatch_log_metric_filter" "public_app_to_lab_mysql_connection_failure" {
  name           = "public-app-to-lab-mysql-connection-failure"
  log_group_name = aws_cloudwatch_log_group.vpc_flow_log.name

  pattern = "${data.aws_network_interface.public_app_eni.id} * * * 3306 * REJECT OK"
  # Wildcard on these fields: $${srcaddr} $${dstaddr} $${srcport} $${protocol} (value doesn't matter)

  metric_transformation {
    name      = "PublicAppToLabMySqlConnectionFailure"
    namespace = "Custom/VPC"
    value     = "1"
  }
}
# Alarm
resource "aws_cloudwatch_metric_alarm" "public_app_to_lab_mysql_connection_failure" {
  alarm_name          = "public-app-to-lab-mysql-connection-failure"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "PublicAppToLabMySqlConnectionFailure"
  namespace           = "Custom/VPC"
  period              = 300
  statistic           = "Sum"
  threshold           = 20

  alarm_description = "Triggers when EC2 to RDS REJECT traffic exceeds 20 in 10 minutes"
  alarm_actions     = [aws_sns_topic.app_to_rds_connection_failure_alert.arn]

  tags = {
    Name        = "public-app-to-lab-mysql-connection-failure"
    App         = "${local.application}"
    Environment = "${local.environment}"
    Component   = "alarm-db"
    Scope       = "monitoring-connectivity"
    Severity   = "medium"
  }
}


# CloudWatch Alarm - LabMySQL Auth Failure
# Metric
resource "aws_cloudwatch_log_metric_filter" "lab_mysql_auth_failure" {
  name           = "lab-mysql-auth-failure"
  log_group_name = "/aws/rds/instance/${aws_db_instance.lab_mysql.id}/error"

  pattern = "\"Access denied for user\"" # Escape quotes to use full pattern with quotes included.

  metric_transformation {
    name      = "MySQLAuthFailure"
    namespace = "Custom/RDS"
    value     = "1"
  }
}
# Alarm
resource "aws_cloudwatch_metric_alarm" "alarm_lab_mysql_auth_failure" {
  alarm_name          = "alarm-lab-mysql-auth-failure"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "MySQLAuthFailure"
  namespace           = "Custom/RDS"
  period              = 300
  statistic           = "Sum"
  threshold           = 20

  alarm_description = "Triggers when MySQL db auth failures exceed 20 in 10 minutes"
  alarm_actions     = [aws_sns_topic.lab_mysql_auth_failure_alert.arn]

  tags = {
    Name        = "alarm-lab-mysql-auth-failures"
    App         = "${local.application}"
    Environment = "${local.environment}"
    Component   = "alarm-db"
    Scope       = "monitoring-login"
    Severity   = "medium"
  }
}