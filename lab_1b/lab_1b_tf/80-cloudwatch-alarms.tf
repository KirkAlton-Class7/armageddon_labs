resource "aws_cloudwatch_log_metric_filter" "rds_reject_traffic" {
  name           = "rds-reject-traffic"
  log_group_name = aws_cloudwatch_log_group.vpc_flow_log.name

    pattern = "${data.aws_network_interface.public_app_eni.id} * * * 3306 * REJECT OK"
    # Wildcard on these fields: $${srcaddr} $${dstaddr} $${srcport} $${protocol} (value doesn't matter)

  metric_transformation {
    name      = "RDSConnectionRejects"
    namespace = "Custom/VPC"
    value     = "1"
  }
}

resource "aws_cloudwatch_metric_alarm" "rds_connection_rejects" {
  alarm_name          = "rds-connection-rejects"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 2
  metric_name         = "RDSConnectionRejects"
  namespace           = "Custom/VPC"
  period              = 300
  statistic           = "Sum"
  threshold           = 10
  alarm_description   = "EC2 to RDS: REJECT traffic detected"
  alarm_actions       = [aws_sns_topic.ec2_to_rds_reject_alert.arn]
}