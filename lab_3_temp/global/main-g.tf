# ----------------------------------------------------------------
# TOKYO MAIN — MODULES
# ----------------------------------------------------------------

# # ----------------------------------------------------------------
# # MODULE — NETWORK
# # ----------------------------------------------------------------

# module "network" {
#   source = "../../modules/network"

#   # Identity and Naming
#   context     = local.context
#   account_id  = local.account_id
#   name_prefix = local.name_prefix
#   name_suffix = local.name_suffix

#   # VPC Configuration
#   vpc_cidr = var.vpc_cidr
#   azs      = local.azs

#   # Security Integration
#   vpc_endpoints_sg_id = module.security.vpc_endpoints_sg_id

#   # Demo Metadata (Not used for deployment)
#   demo_owner = var.demo_owner #DEMO: Root variable var.demo_owner is passed into module variable demo_owner
# }

# # ----------------------------------------------------------------
# # MODULE — SECURITY
# # ----------------------------------------------------------------

# module "security" {
#   source = "../../modules/security"

#   # Providers
#   providers = {
#     aws.global = aws.global
#   }

#   # Identity and Naming
#   context     = local.context
#   account_id  = local.account_id
#   name_prefix = local.name_prefix
#   name_suffix = local.name_suffix

#   # VPC Context
#   vpc_cidr = module.network.vpc_cidr
#   vpc_id   = module.network.vpc_id

#   # WAF Logging Configuration
#   waf_log_retention_days             = var.waf_log_retention_days
#   enable_waf_sampled_requests_only   = var.enable_waf_sampled_requests_only
#   enable_direct_service_log_delivery = var.enable_direct_service_log_delivery

#   waf_log_mode            = local.waf_log_mode
#   waf_log_destination_arn = module.observability.waf_log_destination_arn
# }

# # ----------------------------------------------------------------
# # MODULE — IAM
# # ----------------------------------------------------------------

# module "iam" {
#   source = "../../modules/iam"

#   # Identity and Naming
#   context     = local.context
#   account_id  = local.account_id
#   name_prefix = local.name_prefix
#   name_suffix = local.name_suffix

#   # Logging Permissions
#   enable_direct_service_log_delivery = module.security.enable_direct_service_log_delivery
#   waf_log_mode                       = local.waf_log_mode

#   # Log Destinations
#   vpc_flow_log_group_arn      = module.observability.vpc_flow_log_group_arn
#   waf_firehose_log_group_arn  = module.observability.waf_firehose_log_group_arn
#   waf_firehose_log_bucket_arn = module.observability.waf_firehose_logs_bucket_arn
#   waf_direct_log_group_arn    = module.observability.waf_direct_log_group_arn

#   # Secrets Access
#   db_secret_arn = module.database.db_secret_arn
# }

# # ----------------------------------------------------------------
# # MODULE — DATABASE
# # ----------------------------------------------------------------

# module "database" {
#   source = "../../modules/database"

#   # Identity and Naming
#   context     = local.context
#   name_prefix = local.name_prefix
#   name_suffix = local.name_suffix

#   # Security Groups
#   private_db_sg_id = module.security.private_db_sg_id

#   # Database Configuration
#   db_engine   = local.normalized_db_engine
#   db_username = var.db_username

#   # Network Subnets
#   private_app_subnet_ids  = module.network.private_app_subnet_ids
#   private_data_subnet_ids = module.network.private_data_subnet_ids

#   # Subnet Metadata
#   private_app_subnet_tags  = module.network.private_app_subnet_tags
#   private_data_subnet_tags = module.network.private_subnet_tags

#   # Monitoring and Alerting
#   rds_enhanced_monitoring_role_arn = module.iam.rds_enhanced_monitoring_role_arn
#   rds_failure_alert_topic_arn      = module.observability.rds_failure_alert_topic_arn

#   # Secrets
#   db_secret_arn = module.database.db_secret_arn
# }

# # ----------------------------------------------------------------
# # MODULE — COMPUTE
# # ----------------------------------------------------------------

# module "compute" {
#   source = "../../modules/compute"

#   # Identity and Naming
#   context     = local.context
#   name_prefix = local.name_prefix
#   name_suffix = local.name_suffix

#   # DNS Context
#   dns_context = local.dns_context

#   # VPC Context
#   vpc_id = module.network.vpc_id

#   # Security Groups
#   rds_app_asg_sg_id = module.security.rds_app_asg_sg_id
#   alb_origin_sg_id  = module.security.alb_origin_sg_id

#   # IAM Roles
#   iam_role_rds_app_name         = module.iam.rds_app_role_name
#   rds_app_instance_profile_name = module.iam.rds_app_instance_profile_name

#   # Network Subnets
#   public_subnet_ids      = module.network.public_subnet_ids
#   private_app_subnet_ids = module.network.private_app_subnet_ids

#   # Subnet Metadata
#   public_subnet_tags      = module.network.public_subnet_tags
#   private_app_subnet_tags = module.network.private_app_subnet_tags

#   # Application Secrets
#   db_secret_arn = module.database.db_secret_arn

#   # ALB Logging
#   alb_access_logs_prefix = var.alb_access_logs_prefix
#   alb_log_s3             = var.alb_log_s3
#   alb_logs_bucket_id     = module.observability.alb_logs_bucket_id

#   # Edge Integration
#   edge_auth_header_name = local.edge_auth_header_name
#   edge_auth_value       = module.edge.edge_auth_value

#   # Network Dependencies
#   ec2_vpc_endpoints_ready = module.network.ec2_vpc_endpoints_ready

#   # Certificate Validation — Regional TLS (ALB)
#   rds_app_cert_validation_fqdns = module.dns.rds_app_cert_validation_fqdns
# }

# # ----------------------------------------------------------------
# # EDGE
# # ----------------------------------------------------------------

# module "edge" {
#   source = "../../modules/edge"

#   # Providers
#   providers = {
#     aws.global = aws.global
#   }

#   # Identity and Naming
#   context     = local.context
#   name_prefix = local.name_prefix
#   name_suffix = local.name_suffix

#   # DNS Context
#   dns_context = local.dns_context

#   # # Route53 Management
#   # manage_route53_in_terraform = var.manage_route53_in_terraform
#   # route53_private_zone        = var.route53_private_zone

#   # Edge Security
#   edge_auth_header_name = local.edge_auth_header_name

#   # Certificate Validation — CloudFront TLS
#   rds_app_cf_cert_validation_fqdns = module.dns.rds_app_cf_cert_validation_fqdns
# }


# # ----------------------------------------------------------------
# # MODULE — DNS
# # ----------------------------------------------------------------

# module "dns" {
#   source = "../../modules/dns"

#   # Providers
#   providers = {
#     aws.global = aws.global
#   }

#   # Identity and Naming
#   context     = local.context
#   name_prefix = local.name_prefix
#   name_suffix = local.name_suffix

#   # DNS Context
#   dns_context = local.dns_context

#   # Route53 Management
#   manage_route53_in_terraform = var.manage_route53_in_terraform
#   route53_private_zone        = var.route53_private_zone

#   # ALB Origin
#   rds_app_public_alb_dns_name = module.compute.rds_app_public_alb_dns_name
#   rds_app_public_alb_zone_id  = module.compute.rds_app_public_alb_zone_id

#   # Edge Integration
#   cloudfront_distribution = module.edge.cloudfront_distribution

#   # Certificate Validation - Regional (ALB Certificate)
#   rds_app_cert_domain_validation_options = module.compute.rds_app_cert_domain_validation_options
  
#   # Certificate Validation - Edge (CloudFront Certificate)
#   rds_app_cf_cert_domain_validation_options = module.edge.rds_app_cf_cert_domain_validation_options
# }


# # ----------------------------------------------------------------
# # MODULE — OBSERVABILITY
# # ----------------------------------------------------------------

# module "observability" {
#   source = "../../modules/observability"

#   # Providers
#   providers = {
#     aws.global = aws.global
#   }

#   # Identity and Naming
#   context       = local.context
#   account_id    = local.account_id
#   name_prefix   = local.name_prefix
#   name_suffix   = local.name_suffix
#   bucket_suffix = local.bucket_suffix

#   # Network Context
#   vpc_id = module.network.vpc_id

#   # ALB Logging
#   alb_access_logs_prefix = var.alb_access_logs_prefix
#   alb_log_s3             = var.alb_log_s3

#   # Database Monitoring
#   db_identifier = module.database.db_identifier

#   # Compute Metrics
#   rds_app_public_alb_arn_suffix = module.compute.rds_app_public_alb_arn_suffix
#   rds_app_asg_tg_arn_suffix     = module.compute.rds_app_asg_tg_arn_suffix
#   rds_app_asg_name              = module.compute.rds_app_asg_name

#   # WAF Integration
#   waf_log_mode     = local.waf_log_mode
#   rds_app_waf_name = module.security.rds_app_waf_name
#   rds_app_waf_arn  = module.security.rds_app_waf_arn

#   # IAM Integration
#   vpc_flow_log_role_arn = module.iam.vpc_flow_log_role_arn
# }

# ----------------------------------------------------------------
# EDGE
# ----------------------------------------------------------------

module "edge" {
  source = "../modules/edge"

  # Identity and Naming
  context     = local.context
  name_prefix = local.name_prefix
  name_suffix = local.name_suffix

  # DNS Context
  dns_context = local.dns_context

  # Edge Security
  edge_auth_header_name = local.edge_auth_header_name

  # Certificate Validation — CloudFront TLS
  rds_app_cf_cert_validation_fqdns = module.dns.rds_app_cf_cert_validation_fqdns

  edge_auth_value = data.terraform_remote_state.tokyo.outputs.edge_auth_value
}

# ----------------------------------------------------------------
# MODULE — DNS
# ----------------------------------------------------------------

module "dns" {
  source = "../modules/dns"

  # Providers
    providers = {
    aws          = aws
    aws.regional = aws.regional
  }

  # Identity and Naming
  context     = local.context
  name_prefix = local.name_prefix
  name_suffix = local.name_suffix

  # DNS Context
  dns_context = local.dns_context

  # Route53 Management
  manage_route53_in_terraform = var.manage_route53_in_terraform
  route53_private_zone        = var.route53_private_zone

  # Regional Origin (Tokyo ALB)
  rds_app_public_alb_dns_name = data.terraform_remote_state.tokyo.outputs.rds_app_public_alb_dns_name
  rds_app_public_alb_zone_id  = data.terraform_remote_state.tokyo.outputs.rds_app_public_alb_zone_id

  # CloudFront Distribution
  cloudfront_distribution = module.edge.cloudfront_distribution

  # Regional Certificate Validation Options (ALB)
  rds_app_cert_domain_validation_options = data.terraform_remote_state.tokyo.outputs.rds_app_cert_domain_validation_options

  # Edge Certificate Validation Options (ALB)
  rds_app_cf_cert_domain_validation_options = module.edge.rds_app_cf_cert_domain_validation_options

  rds_app_cert_arn = data.terraform_remote_state.tokyo.outputs.rds_app_cert_arn
  rds_app_cf_cert_arn = module.edge.rds_app_cf_cert_arn
}