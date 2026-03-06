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

  # Identity and Naming
  context     = local.context
  name_prefix = local.name_prefix
  name_suffix = local.name_suffix

  # DNS Context
  dns_context = local.dns_context

  # Edge Authentication
  edge_auth_header_name = local.edge_auth_header_name

  # Regional Origin Integration (Tokyo ALB)
  rds_app_public_alb_dns_name = data.terraform_remote_state.tokyo.outputs.rds_app_public_alb_dns_name
  rds_app_public_alb_zone_id  = data.terraform_remote_state.tokyo.outputs.rds_app_public_alb_zone_id

  manage_route53_in_terraform = ""
  route53_private_zone = ""
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

  # Identity and Naming
  context     = local.context
  name_prefix = local.name_prefix
  name_suffix = local.name_suffix

  # DNS Context
  dns_context = local.dns_context

  # Route53 Management
  manage_route53_in_terraform = var.manage_route53_in_terraform
  route53_private_zone        = var.route53_private_zone

  # Regional Origin Integration (Tokyo ALB)
  rds_app_public_alb_dns_name = data.terraform_remote_state.tokyo.outputs.rds_app_public_alb_dns_name
  rds_app_public_alb_zone_id  = data.terraform_remote_state.tokyo.outputs.rds_app_public_alb_zone_id
}