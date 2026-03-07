# ----------------------------------------------------------------
# GLOBAL MAIN — MODULES
# ----------------------------------------------------------------


# ----------------------------------------------------------------
# MODULE — EDGE
# ----------------------------------------------------------------

module "edge" {
  source = "../modules/edge"

  # Providers
  providers = {
    aws.global = aws.global
  }

  # ----------------------------------------------------------------
  # Identity and Naming
  # ----------------------------------------------------------------
  context     = local.context
  name_prefix = local.name_prefix
  name_suffix = local.name_suffix

  # ----------------------------------------------------------------
  # DNS Context
  # ----------------------------------------------------------------
  dns_context = local.dns_context

  # ----------------------------------------------------------------
  # Edge Security
  # ----------------------------------------------------------------
  edge_auth_header_name = local.edge_auth_header_name

  rds_app_cf_cert_validation_fqdns = module.dns.rds_app_cf_cert_validation_fqdns
}


# ----------------------------------------------------------------
# MODULE — DNS
# ----------------------------------------------------------------

module "dns" {
  source = "../modules/dns"

  # Providers
  providers = {
    aws.global = aws.global
  }

  # ----------------------------------------------------------------
  # Identity and Naming
  # ----------------------------------------------------------------
  context     = local.context
  name_prefix = local.name_prefix
  name_suffix = local.name_suffix

  # ----------------------------------------------------------------
  # DNS Context
  # ----------------------------------------------------------------
  dns_context = local.dns_context

  # ----------------------------------------------------------------
  # Route53 Management
  # ----------------------------------------------------------------
  manage_route53_in_terraform = var.manage_route53_in_terraform
  route53_private_zone        = var.route53_private_zone

  # ----------------------------------------------------------------
  # CloudFront Integration
  # ----------------------------------------------------------------
  cloudfront_distribution = module.edge.cloudfront_distribution

  # ----------------------------------------------------------------
  # Regional Origin (Tokyo ALB)
  # ----------------------------------------------------------------
  rds_app_public_alb_dns_name = data.terraform_remote_state.tokyo.outputs.rds_app_public_alb_dns_name
  rds_app_public_alb_zone_id  = data.terraform_remote_state.tokyo.outputs.rds_app_public_alb_zone_id

  # ----------------------------------------------------------------
  # Certificate Validation — Edge (CloudFront)
  # ----------------------------------------------------------------
  rds_app_cf_cert_domain_validation_options =
    module.edge.rds_app_cf_cert_domain_validation_options
}