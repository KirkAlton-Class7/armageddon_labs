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
# TOKYO OUTPUT — CloudFront Origin Authentication Secret
# ----------------------------------------------------------------

output "edge_auth_value" {
  description = "Secret header value used to authenticate CloudFront requests to the ALB origin."
  value = random_password.edge_auth_value.result
  sensitive = true
}

# ----------------------------------------------------------------
# TOKYO OUTPUTS — ALB Origin (Regional)
# ----------------------------------------------------------------

output "rds_app_public_alb_dns_name" {
  description = "DNS name of the public ALB used as the CloudFront origin."
  value       = module.compute.rds_app_public_alb_dns_name
}

output "rds_app_public_alb_zone_id" {
  description = "Hosted zone ID of the public ALB used for Route53 alias records."
  value       = module.compute.rds_app_public_alb_zone_id
}

# ----------------------------------------------------------------
# TOKYO OUTPUTS — Regional Certificate Validation Options
# ----------------------------------------------------------------

output "rds_app_cert_domain_validation_options" {
  description = "Domain validation options for the regional ACM certificate."
  value       = module.compute.rds_app_cert_domain_validation_options
}

# ----------------------------------------------------------------
# TOKYO OUTPUTS — Application Access
# ----------------------------------------------------------------

output "application_access" {
  description = "Primary application endpoints."

  value = {
    application_url   = ""
    cloudfront_domain = ""
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

    public_subnets       = module.network.public_subnet_ids
    private_app_subnets  = module.network.private_app_subnet_ids
    private_data_subnets = module.network.private_data_subnet_ids

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


# ----------------------------------------------------------------
# COMPUTE OUTPUTS — Regional ACM Certificate ARN (ALB)
# ----------------------------------------------------------------

output "rds_app_cert_arn" {
  description = "ACM certificate ARN used by the ALB."
  value       = module.compute.rds_app_cert_arn
}

# # ----------------------------------------------------------------
# # TOKYO OUTPUTS — Transit Gateway Peering
# # ----------------------------------------------------------------
# # Exposes TGW peering attachment ID for cross-region acceptance
# # !! PHASE 2: Only available after peering is created

# output "tgw_peering_attachment_id" {
#   description = "Transit Gateway peering attachment ID (Tokyo → Sao Paulo)."

#   value = try(
#     aws_ec2_transit_gateway_peering_attachment.tokyo_to_saopaulo.id,
#     null
#   )
# }