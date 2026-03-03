# ----------------------------------------------------------------
# OUTPUT — RDS Enhanced Monitoring Role Name
# ----------------------------------------------------------------
output "rds_enhanced_monitoring_role_name" {
  description = "Name of the RDS Enhanced Monitoring IAM role"
  value       = aws_iam_role.rds_enhanced_monitoring_role.name
}

# ----------------------------------------------------------------
# OUTPUT — RDS Enhanced Monitoring Role ARN
# ----------------------------------------------------------------
output "rds_enhanced_monitoring_role_arn" {
  description = "ARN of the RDS Enhanced Monitoring IAM role"
  value       = aws_iam_role.rds_enhanced_monitoring_role.arn
}

# ----------------------------------------------------------------
# OUTPUT — RDS Enhanced Monitoring Role ID
# ----------------------------------------------------------------
output "rds_enhanced_monitoring_role_id" {
  description = "Unique ID of the RDS Enhanced Monitoring IAM role"
  value       = aws_iam_role.rds_enhanced_monitoring_role.id
}








# ----------------------------------------------------------------
# OUTPUT — RDS App Role Name
# ----------------------------------------------------------------
output "rds_app_role_name" {
  description = "Name of the EC2 RDS App IAM role"
  value       = aws_iam_role.rds_app.name
}

# ----------------------------------------------------------------
# OUTPUT — RDS App Role ARN
# ----------------------------------------------------------------
output "rds_app_role_arn" {
  description = "ARN of the EC2 RDS App IAM role"
  value       = aws_iam_role.rds_app.arn
}

# ----------------------------------------------------------------
# OUTPUT — RDS App Role ID
# ----------------------------------------------------------------
output "rds_app_role_id" {
  description = "Unique ID of the EC2 RDS App IAM role"
  value       = aws_iam_role.rds_app.id
}



# ----------------------------------------------------------------
# OUTPUT — RDS App Instance Profile Name
# ----------------------------------------------------------------
output "rds_app_instance_profile_name" {
  description = "Instance profile name for EC2 RDS App"
  value       = aws_iam_instance_profile.rds_app.name
}

# ----------------------------------------------------------------
# OUTPUT — RDS App Instance Profile ARN
# ----------------------------------------------------------------
output "rds_app_instance_profile_arn" {
  description = "Instance profile ARN for EC2 RDS App"
  value       = aws_iam_instance_profile.rds_app.arn
}








# ----------------------------------------------------------------
# OUTPUT — VPC Flow Log Role Name
# ----------------------------------------------------------------
output "vpc_flow_log_role_name" {
  description = "Name of the VPC Flow Log IAM role"
  value       = aws_iam_role.vpc_flow_log_role.name
}

# ----------------------------------------------------------------
# OUTPUT — VPC Flow Log Role ARN
# ----------------------------------------------------------------
output "vpc_flow_log_role_arn" {
  description = "ARN of the VPC Flow Log IAM role"
  value       = aws_iam_role.vpc_flow_log_role.arn
}

# ----------------------------------------------------------------
# OUTPUT — VPC Flow Log Role ID
# ----------------------------------------------------------------
output "vpc_flow_log_role_id" {
  description = "Unique ID of the VPC Flow Log IAM role"
  value       = aws_iam_role.vpc_flow_log_role.id
}


# CONDITIONAL RESOURCES
# ----------------------------------------------------------------
# OUTPUT — Firehose Network Telemetry Role Name
# ----------------------------------------------------------------
output "firehose_network_telemetry_role_name" {
  description = "Name of the Firehose Network Telemetry IAM role"
  value       = try(aws_iam_role.firehose_network_telemetry_role[0].name, null)
}

# ----------------------------------------------------------------
# OUTPUT — Firehose Network Telemetry Role ARN
# ----------------------------------------------------------------
output "firehose_network_telemetry_role_arn" {
  description = "ARN of the Firehose Network Telemetry IAM role"
  value       = try(aws_iam_role.firehose_network_telemetry_role[0].arn, null)
}

# ----------------------------------------------------------------
# OUTPUT — Firehose Network Telemetry Role ID
# ----------------------------------------------------------------
output "firehose_network_telemetry_role_id" {
  description = "Unique ID of the Firehose Network Telemetry IAM role"
  value       = try(aws_iam_role.firehose_network_telemetry_role[0].id, null)
}