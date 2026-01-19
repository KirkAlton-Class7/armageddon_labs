# VPC Flow Log
resource "aws_flow_log" "vpc" {
  iam_role_arn = aws_iam_role.vpc_flow_log_role.arn

  log_format = "$${interface-id} $${srcaddr} $${dstaddr} $${srcport} $${dstport} $${protocol} $${action} $${log-status}"
  # Fields for AWS Flow Logs.
  # ENI, Source Adress, Destination Address, Source Port, Destination Port, Protcol, Action, Log Status
  log_destination = aws_cloudwatch_log_group.vpc_flow_log.arn # CloudWatch as a destination doesn't require log_destination_type (other destinations require it).

  traffic_type = "ALL"
  vpc_id       = aws_vpc.main.id
}