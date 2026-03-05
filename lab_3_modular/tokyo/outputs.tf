# ----------------------------------------------------------------
# OUTPUTS — Application Context
# ----------------------------------------------------------------

output "application_name" {
  description = "Application name"
  value       = local.context.app
}

output "environment" {
  description = "Environment"
  value       = local.context.env
}

output "region" {
  description = "Region (name)"
  value       = local.context.region
}

# ----------------------------------------------------------------
# OUTPUTS — Database
# ----------------------------------------------------------------

output "db_endpoint" {
  description = "Database endpoint"
  value       = module.database.db_endpoint
}

output "db_secret_arn" {
  description = "ARN of the database secret"
  value       = module.database.db_secret_arn
}

# ----------------------------------------------------------------
# OUTPUTS — Networking
# ----------------------------------------------------------------

output "vpc_id" {
  description = "VPC ID for downstream modules"
  value       = module.network.vpc_id
}

output "public_subnets" {
  description = "Public subnet IDs"
  value       = module.network.public_subnets
}

output "private_app_subnets" {
  description = "Private application subnet IDs"
  value       = module.network.private_app_subnets
}

output "private_data_subnets" {
  description = "Private data subnet IDs"
  value       = module.network.private_data_subnets
}

# ----------------------------------------------------------------
# OUTPUTS — Edge / CDN
# ----------------------------------------------------------------

output "cloudfront_domain" {
  description = "CloudFront distribution domain name"
  value       = module.edge_dns_cdn.cloudfront_domain
}

# ----------------------------------------------------------------
# OUTPUTS — Observability
# ----------------------------------------------------------------

output "vpc_flow_log_group_arn" {
  description = "CloudWatch log group ARN for VPC Flow Logs"
  value       = module.observability.vpc_flow_log_group_arn
}

output "waf_firehose_log_group_arn" {
  description = "CloudWatch log group ARN for WAF Firehose logs"
  value       = module.observability.waf_firehose_log_group_arn
}

output "waf_firehose_logs_bucket_arn" {
  description = "S3 bucket ARN for WAF Firehose logs"
  value       = module.observability.waf_firehose_logs_bucket_arn
}

output "waf_direct_log_group_arn" {
  description = "CloudWatch log group ARN for direct WAF logs"
  value       = module.observability.waf_direct_log_group_arn
}

# ----------------------------------------------------------------
# OUTPUTS — IAM
# ----------------------------------------------------------------

output "rds_enhanced_monitoring_role_name" {
  description = "Name of the RDS Enhanced Monitoring IAM role"
  value       = module.iam.rds_enhanced_monitoring_role_name
}

output "rds_enhanced_monitoring_role_arn" {
  description = "ARN of the RDS Enhanced Monitoring IAM role"
  value       = module.iam.rds_enhanced_monitoring_role_arn
}

output "rds_enhanced_monitoring_role_id" {
  description = "Unique ID of the RDS Enhanced Monitoring IAM role"
  value       = module.iam.rds_enhanced_monitoring_role_id
}

# ----------------------------------------------------------------
# OUTPUTS — Demonstration (Not used in deployment)
# ----------------------------------------------------------------

output "demo_owner_from_module" {
  description = "DEMO: Transformed value returned from module."
  value       = module.network.demo_owner_normalized
}