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