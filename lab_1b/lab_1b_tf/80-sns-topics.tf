resource "aws_sns_topic" "rds_failure_alert" {
  name = "rds-failures-alert"
}

resource "aws_sns_topic" "ec2_to_rds_reject_alert" {
  name = "ec2-to-rds-reject-traffic-alert"
}