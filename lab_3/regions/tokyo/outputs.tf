# ----------------------------------------------------------------
# TOKYO OUTPUTS — Application Context
# ----------------------------------------------------------------

output "application_context" {
  description = "Deployment context information."

  value = {
    application = local.context.app
    environment = local.context.env
    region      = local.context.region
  }
}

# ----------------------------------------------------------------
# TOKYO OUTPUTS — Application Access
# ----------------------------------------------------------------

output "application_access" {
  description = "Primary application endpoints."

  value = {
    application_url   = module.edge.application_url.url
    cloudfront_domain = module.edge.cloudfront_domain
    alb_dns_name      = module.compute.rds_app_public_alb_dns_name
    database_endpoint = module.database.db_endpoint
  }
}

# ----------------------------------------------------------------
# TOKYO OUTPUTS — Infrastructure Summary
# ----------------------------------------------------------------

output "infrastructure_summary" {
  description = "High-level infrastructure summary."

  value = {
    vpc_id   = module.network.vpc_id
    vpc_cidr = module.network.vpc_cidr

    public_subnets       = module.network.public_subnets
    private_app_subnets  = module.network.private_app_subnets
    private_data_subnets = module.network.private_data_subnets

    alb_name      = module.compute.rds_app_public_alb_name
    asg_name      = module.compute.rds_app_asg_name
    db_identifier = module.database.db_identifier
  }
}

# ----------------------------------------------------------------
# TOKYO OUTPUTS — Compute Capacity
# ----------------------------------------------------------------

output "compute_capacity" {
  description = "Auto Scaling configuration."

  value = {
    asg_name         = module.compute.rds_app_asg_name
    desired_capacity = module.compute.rds_app_asg_desired_capacity
    min_size         = module.compute.rds_app_asg_min_size
    max_size         = module.compute.rds_app_asg_max_size
  }
}

# ----------------------------------------------------------------
# TOKYO OUTPUTS — Security Summary
# ----------------------------------------------------------------

output "security_summary" {
  description = "Security configuration summary."

  value = {
    waf_name     = module.security.rds_app_waf_name
    waf_capacity = module.security.rds_app_waf_capacity

    alb_security_group = module.security.alb_origin_sg_id
    app_security_group = module.security.rds_app_asg_sg_id
    db_security_group  = module.security.private_db_sg_id
  }
}

# ----------------------------------------------------------------
# TOKYO OUTPUTS — Deployment Logging Configuration
# ----------------------------------------------------------------

output "deployment_logging_configuration" {
  description = "Deployment logging configuration and log destinations for ALB, WAF, and VPC flow logs."
  value       = module.observability.logging_configuration
}

# ----------------------------------------------------------------
# TOKYO OUTPUTS — Deployment Metadata
# ----------------------------------------------------------------

output "deployment_metadata" {
  description = "Deployment metadata."

  value = {
    region      = local.context.region
    environment = local.context.env
    application = local.context.app
    vpc_id      = module.network.vpc_id
  }
}

