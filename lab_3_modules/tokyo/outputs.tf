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




output "db_endpoint" {
  description = "Database endpoint"
  value       = module.database.db_endpoint
}


# SUBNETS
# Public Subnet IDs
output "public_subnets" {
  description = "Public subnet IDs"
  value       = module.network.public_subnets
}

# Private App Subnet IDs
output "private_app_subnets" {
  description = "Private app subnet IDs"
  value       = module.network.public_subnets
}

# Private Data Subnet IDs
output "private_data_subnets" {
  description = "Private data subnet IDs"
  value       = module.network.public_subnets
}
















# ----------------------------------------------------------------
# DEMONSTRATION OUTPUTS (Not used in deployment)
# ----------------------------------------------------------------

# Demo Owner from Module
output "demo_owner_from_module" {
  description = "DEMO: Transformed value returned from module."
  value       = module.network.demo_owner_normalized
} 






# VPC ID
output "vpc_id" {
  description = "VPC ID for downstream modules"
  value       = module.network.aws_vpc.main.id
}






output "alb_dns" {
  value = module.compute.alb_dns
}

output "cloudfront_domain" {
  value = module.edge_dns_cdn.cloudfront_domain
}


output "db_secret_arn" {
  value = module.database.aws_secretsmanager_secret.lab_rds_mysql.arn
}






output "vpc_flow_log_group_arn" {
  value = module.observability.vpc_flow_log_group_arn
}


output "waf_firehose_log_group_arn" {
  value = module.observability.waf_firehose_log_group_arn
  }

output "waf_firehose_log_bucket_arn" {
  value = module.observability.waf_firehose_log_bucket_arn
}

output "waf_direct_log_group_arn" {
  value = module.observability.waf_direct_log_group_arn
}






# ----------------------------------------------------------------
# ROOT OUTPUT — RDS Enhanced Monitoring Role Name
# ----------------------------------------------------------------
output "rds_enhanced_monitoring_role_name" {
  description = "Name of the RDS Enhanced Monitoring IAM role"
  value       = module.iam.rds_enhanced_monitoring_role_name
}

# ----------------------------------------------------------------
# ROOT OUTPUT — RDS Enhanced Monitoring Role ARN
# ----------------------------------------------------------------
output "rds_enhanced_monitoring_role_arn" {
  description = "ARN of the RDS Enhanced Monitoring IAM role"
  value       = module.iam.rds_enhanced_monitoring_role_arn
}

# ----------------------------------------------------------------
# ROOT OUTPUT — RDS Enhanced Monitoring Role ID
# ----------------------------------------------------------------
output "rds_enhanced_monitoring_role_id" {
  description = "Unique ID of the RDS Enhanced Monitoring IAM role"
  value       = module.iam.rds_enhanced_monitoring_role_id
}