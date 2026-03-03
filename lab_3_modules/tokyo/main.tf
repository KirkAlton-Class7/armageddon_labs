module "network" {
  source      = "../modules/network"

  # Variables - Identity
  context     = local.context
  account_id  = local.account_id
  name_prefix = local.name_prefix
  name_suffix = local.name_suffix

  # Variables - VPC
  vpc_cidr    = var.vpc_cidr

  # Variables - DEMO OWNER (not used for deployment)
  demo_owner  = var.demo_owner # DEMO: Root variable (var.demo_owner) is passed into module variable (demo_owner)
}

module "security" {
  source      = "../modules/security"
  
  # Providers
  providers = {
    aws.global = aws.global
  }

  # Variables - Identity
  context     = local.context
  account_id  = local.account_id
  name_prefix = local.name_prefix
  name_suffix = local.name_suffix
  
  # Variables - VPC
  vpc_cidr    = module.network.vpc_cidr
  vpc_id      = module.network.vpc_id

  waf_log_retention_days = var.waf_log_retention_days

  enable_waf_sampled_requests_only = var.enable_waf_sampled_requests_only

  enable_direct_service_log_delivery = var.enable_direct_service_log_delivery

  waf_log_mode = local.waf_log_mode

  waf_log_destination_arn = module.observability.waf_log_destination_arn
}
module "iam" {
  source                             = "../modules/iam"

  # Variables - Identity
  context                            = local.context
  account_id                         = local.account_id
  name_prefix                        = local.name_prefix
  name_suffix                        = local.name_suffix
  #bucket_suffix = random_id.bucket_suffix.hex

  # Variables - WAF Log Delivery Toggle
  enable_direct_service_log_delivery = module.security.enable_direct_service_log_delivery

  db_secret_arn = module.database.db_secret_arn

  waf_log_mode = local.waf_log_mode
  vpc_flow_log_group_arn = module.observability.vpc_flow_log_group_arn
  waf_firehose_log_group_arn = module.observability.waf_firehose_log_group_arn
  waf_firehose_log_bucket_arn = module.observability.waf_firehose_log_bucket_arn
  waf_direct_log_group_arn = module.observability.waf_direct_log_group_arn
}

module "database" {
  source             = "../modules/database"

  # Variables - Identity
  context            = local.context
  name_prefix        = local.name_prefix
  name_suffix        = local.name_suffix

  # Variables - Security Groups
  private_db_sg_id  = module.security.private_db_sg_id

  # Variables - Database Access
  db_engine = local.normalized_db_engine
  db_username = var.db_username

  # Variables - Subnet IDs
  public_subnets       = module.network.public_subnet_ids
  private_app_subnets  = module.network.private_app_subnet_ids
  private_data_subnets = module.network.private_data_subnet_ids
  
  # Variables - Subnet & Resource Tags
  public_subnet_tags = module.network.public_subnet_tags
  private_app_subnet_tags = module.network.private_app_subnet_tags
  private_data_subnet_tags = module.network.private_subnet_tags

  db_secret_arn = module.database.db_secret_arn
}

module "compute" {
  source = "../modules/compute"
  
  # Variables - Identity
  context     = local.context
  name_prefix = local.name_prefix
  name_suffix = local.name_suffix

  # Variables - VPC
  vpc_id = module.network.aws_vpc.main.id
  # Variables - Security
  rds_app_asg_security_group_id = module.security.aws_security_group.rds_app_asg.id

  # Variables - IAM
  rds_app_iam_role = ""

  # Variables - ALB Access Logs Prefix
  alb_access_logs_prefix = var.alb_access_logs_prefix
  
  # Variables - RDS Secrets
  db_secret_arn = module.database.db_secret_arn
  
  # Variables - Subnet IDs
  public_subnet_ids  = module.network.public_subnet_ids
  private_app_subnet_ids = module.network.private_subnet_ids

  # Variables - Subnet & Resource Tags
  public_subnet_tags = module.network.public_subnet_tags
  private_app_subnet_tags = module.network.private_app_subnet_tags
  
  edge_auth_header_name = local.edge_auth_header_name

  alb_log_s3 = var.alb_log_s3

  aws_iam_role_rds_app_name = module.iam.aws_iam_role.rds_app.name
}

module "edge_dns_cdn" {
  source = "../modules/edge_dns_cdn"

  # Providers
  providers = {
    aws.global = aws.global
    }

  # Variables - Identity
  context     = local.context
  name_prefix = local.name_prefix
  name_suffix = local.name_suffix

  dns_context = local.dns_context

  manage_route53_in_terraform = var.manage_route53_in_terraform

  route53_private_zone = var.route53_private_zone

  edge_auth_header_name = local.edge_auth_header_name

  alb_zone_id = module.compute.alb_zone_id

  alb_dns = module.compute.alb_dns
}

module "observability" {
  source = "../modules/observability"
  # Providers
  providers = {
    aws.global = aws.global
    }

  # Variables - Identity
  context     = local.context
  account_id  = local.account_id

  name_prefix = local.name_prefix
  name_suffix = local.name_suffix
  bucket_suffix = local.bucket_suffix

  vpc_id      = module.network.vpc_id

  alb_access_logs_prefix = var.alb_access_logs_prefix

  alb_log_s3 = var.alb_log_s3

  db_identifier = module.database.db_identifier

  alb_arn_suffix = module.compute.alb_arn_suffix

  tg_arn_suffix = module.compute.tg_arn_suffix

  waf_log_mode = local.waf_log_mode
}