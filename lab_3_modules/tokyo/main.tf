module "network" {
  source      = "../modules/network"
  context     = local.context
  account_id  = local.account_id

  vpc_cidr    = var.vpc_cidr

  name_prefix = local.name_prefix
  name_suffix = local.name_suffix
  demo_owner  = var.demo_owner # DEMO: Root variable (var.demo_owner) is passed into module variable (demo_owner)
}

module "security" {
  source      = "../modules/security"
  context     = local.context
  account_id  = local.account_id

  vpc_cidr    = module.network.vpc_cidr
  vpc_id      = module.network.vpc_id

  name_prefix = local.name_prefix
  name_suffix = local.name_suffix
}

module "iam" {
  source                             = "../modules/iam"
  context                            = local.context
  account_id                         = local.account_id
 
  enable_direct_service_log_delivery = module.security.enable_direct_service_log_delivery
 
  name_prefix                        = local.name_prefix
  name_suffix                        = local.name_suffix
  #bucket_suffix = random_id.bucket_suffix.hex
}

module "database" {
  source             = "../modules/database"
  context            = local.context
  
  public_subnets       = module.network.public_subnet_ids
  private_app_subnets  = module.network.private_app_subnet_ids
  private_data_subnets = module.network.private_data_subnet_ids
  public_subnet_tags = module.network.public_subnet_tags
  private_app_subnet_tags = module.network.private_app_subnet_tags
  private_subnet_tags = module.network.private_app_subnet_tags
  
  private_db_sg_id  = module.security.private_db_sg_id
 
  name_prefix        = local.name_prefix
  name_suffix        = local.name_suffix
}

module "compute" {
  source = "../modules/compute"

  vpc_id             = module.network.vpc_id
  public_subnet_ids  = module.network.public_subnet_ids
  private_subnet_ids = module.network.private_subnet_ids

  alb_sg_id = module.security.alb_sg_id
  ec2_sg_id = module.security.ec2_sg_id

  instance_profile = module.iam.ec2_instance_profile

  secret_arn = module.database.secret_arn

  tags = module.core.tags
}

module "edge_dns_cdn" {
  source = "../modules/edge-dns-cdn"

  domain_name = var.root_domain
  alb_dns     = module.compute.alb_dns_name
  waf_arn     = module.security.waf_arn

  tags = module.core.tags
}

module "observability" {
  source = "../modules/observability"

  vpc_id = module.network.vpc_id

  tags = module.core.tags
}

module "secrets_config" {
  source = "../modules/secrets-config"

  db_endpoint = module.database.db_endpoint

  tags = module.core.tags
}