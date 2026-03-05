# ----------------------------------------------------------------
# IAM OUTPUTS — RDS Enhanced Monitoring Role
# ----------------------------------------------------------------

output "rds_enhanced_monitoring_role_name" {
  description = "Name of the RDS enhanced monitoring IAM role."
  value       = aws_iam_role.rds_enhanced_monitoring_role.name
}

output "rds_enhanced_monitoring_role_arn" {
  description = "ARN of the RDS enhanced monitoring IAM role."
  value       = aws_iam_role.rds_enhanced_monitoring_role.arn
}

output "rds_enhanced_monitoring_role_id" {
  description = "ID of the RDS enhanced monitoring IAM role."
  value       = aws_iam_role.rds_enhanced_monitoring_role.id
}

# ----------------------------------------------------------------
# IAM OUTPUTS — RDS App Role
# ----------------------------------------------------------------

output "rds_app_role_name" {
  description = "Name of the EC2 RDS app IAM role."
  value       = aws_iam_role.rds_app.name
}

output "rds_app_role_arn" {
  description = "ARN of the EC2 RDS app IAM role."
  value       = aws_iam_role.rds_app.arn
}

output "rds_app_role_id" {
  description = "ID of the EC2 RDS app IAM role."
  value       = aws_iam_role.rds_app.id
}

# ----------------------------------------------------------------
# IAM OUTPUTS — RDS App Instance Profile
# ----------------------------------------------------------------

output "rds_app_instance_profile_name" {
  description = "Name of the EC2 RDS app instance profile."
  value       = aws_iam_instance_profile.rds_app.name
}

output "rds_app_instance_profile_arn" {
  description = "ARN of the EC2 RDS app instance profile."
  value       = aws_iam_instance_profile.rds_app.arn
}

# ----------------------------------------------------------------
# IAM OUTPUTS — VPC Flow Log Role
# ----------------------------------------------------------------

output "vpc_flow_log_role_name" {
  description = "Name of the VPC flow log IAM role."
  value       = aws_iam_role.vpc_flow_log_role.name
}

output "vpc_flow_log_role_arn" {
  description = "ARN of the VPC flow log IAM role."
  value       = aws_iam_role.vpc_flow_log_role.arn
}

output "vpc_flow_log_role_id" {
  description = "ID of the VPC flow log IAM role."
  value       = aws_iam_role.vpc_flow_log_role.id
}

# ----------------------------------------------------------------
# IAM OUTPUTS — Firehose Network Telemetry Role (Conditional)
# ----------------------------------------------------------------

output "firehose_network_telemetry_role_name" {
  description = "Name of the Firehose network telemetry IAM role."
  value       = try(aws_iam_role.firehose_network_telemetry_role[0].name, null)
}

output "firehose_network_telemetry_role_arn" {
  description = "ARN of the Firehose network telemetry IAM role."
  value       = try(aws_iam_role.firehose_network_telemetry_role[0].arn, null)
}

output "firehose_network_telemetry_role_id" {
  description = "ID of the Firehose network telemetry IAM role."
  value       = try(aws_iam_role.firehose_network_telemetry_role[0].id, null)
}