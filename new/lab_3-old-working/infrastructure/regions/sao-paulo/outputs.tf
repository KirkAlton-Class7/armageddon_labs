# ----------------------------------------------------------------
# SAO PAULO OUTPUTS — Application Context
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
# SAO PAULO OUTPUT — CloudFront Origin Authentication Secret
# ----------------------------------------------------------------

output "edge_auth_value" {
  description = "Secret header value used to authenticate CloudFront requests to the ALB origin."
  value       = random_password.edge_auth_value.result
  sensitive   = true
}

# ----------------------------------------------------------------
# SAO PAULO OUTPUTS — ALB Origin (Regional)
# ----------------------------------------------------------------

output "rds_app_public_alb_dns_name" {
  description = "DNS name of the public ALB used as the CloudFront origin."
  value       = module.compute.rds_app_public_alb_dns_name
}

output "rds_app_public_alb_zone_id" {
  description = "Hosted zone ID of the public ALB used for Route53 alias records."
  value       = module.compute.rds_app_public_alb_zone_id
}

# # ----------------------------------------------------------------
# # SAO PAULO OUTPUTS — Regional Certificate Validation Options
# # ----------------------------------------------------------------

# output "rds_app_cert_domain_validation_options" {
#   description = "Domain validation options for the regional ACM certificate."
#   value       = module.compute.rds_app_cert_domain_validation_options
# }

# ----------------------------------------------------------------
# SAO PAULO OUTPUTS — Application Access
# ----------------------------------------------------------------

output "application_access" {
  description = "Primary application endpoints."

  value = {
    application_url   = ""
    cloudfront_domain = ""
    alb_dns_name      = module.compute.rds_app_public_alb_dns_name
    # database_endpoint = module.database.db_endpoint
  }
}

# ----------------------------------------------------------------
# SAO PAULO OUTPUTS — Infrastructure Summary
# ----------------------------------------------------------------

output "infrastructure_summary" {
  description = "High-level infrastructure summary."

  value = {
    vpc_id   = module.network.vpc_id
    vpc_cidr = module.network.vpc_cidr

    public_subnets       = module.network.public_subnet_ids
    private_app_subnets  = module.network.private_app_subnet_ids
    private_data_subnets = module.network.private_data_subnet_ids

    alb_name      = module.compute.rds_app_public_alb_name
    asg_name      = module.compute.rds_app_asg_name
    db_identifier = data.terraform_remote_state.tokyo.outputs.infrastructure_summary.db_identifier
  }
}

# ----------------------------------------------------------------
# SAO PAULO OUTPUTS — Compute Capacity
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
# SAO PAULO OUTPUTS — Security Summary
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
# SAO PAULO OUTPUTS — Deployment Logging Configuration
# ----------------------------------------------------------------

output "deployment_logging_configuration" {
  description = "Deployment logging configuration and log destinations for ALB, WAF, and VPC flow logs."
  value       = module.observability.logging_configuration
}

# ----------------------------------------------------------------
# SAO PAULO OUTPUTS — Deployment Metadata
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


# ----------------------------------------------------------------
# SAO PAULO OUTPUTS — Transit Gateway (Spoke)
# ----------------------------------------------------------------
output "tgw_id" {
  description = "Transit Gateway ID for the Sao Paulo spoke."
  value       = module.tgw.tgw_id
}
output "tgw_route_table_id" {
  description = "Transit Gateway route table ID for the Sao Paulo spoke."
  value       = module.tgw.tgw_route_table_id
}

output "vpc_cidr" {
  description = "CIDR block of the Sao Paulo VPC."
  value       = module.network.vpc_cidr
}




# ----------------------------------------------------------------
# COMPUTE OUTPUTS — Regional ACM Certificate ARN (ALB)
# ----------------------------------------------------------------

output "rds_app_cert_arn" {
  description = "ACM certificate ARN used by the ALB."
  value       = module.compute.rds_app_cert_arn
}