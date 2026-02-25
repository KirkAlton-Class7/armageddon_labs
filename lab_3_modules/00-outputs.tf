# ----------------------------------------------------------------
# OUTPUTS — Application Context
# ----------------------------------------------------------------

output "application_name" {
  description = "Application name"
  value       = local.app
}

output "environment" {
  description = "Environment"
  value       = local.env
}

output "region" {
  description = "Region (name)"
  value       = var.region
}
