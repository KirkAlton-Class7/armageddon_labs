# ----------------------------------------------------------------
# GLOBAL - Locals
# ----------------------------------------------------------------

locals {

  # ----------------------------------------------------------------
  # Core Identity and Deployment Context
  # ----------------------------------------------------------------

  # Account ID
  account_id = data.aws_caller_identity.current.account_id

  # Availability Zones
  azs = slice(data.aws_availability_zones.available.names, 0, 3)

  # ----------------------------------------------------------------
  # Normalized Deployment Identity
  # ----------------------------------------------------------------
  # Normalization defines deployment identity here, so transformation
  # belongs in the root module.

  normalized_app = lower(var.app)
  normalized_env = lower(var.env)

  # ----------------------------------------------------------------
  # Base Tags
  # ----------------------------------------------------------------

  base_tags = {
    Region      = var.region
    Application = local.normalized_app
    Environment = local.normalized_env
  }

  # ----------------------------------------------------------------
  # Deployment Context Object
  # ----------------------------------------------------------------

  context = {
    region = var.region
    app    = local.normalized_app
    env    = local.normalized_env
    tags   = local.base_tags
  }

  # ----------------------------------------------------------------
  # Naming Helpers
  # ----------------------------------------------------------------

  name_prefix   = "${local.context.app}-${local.context.env}"
  name_suffix   = lower(random_string.suffix.result)
  bucket_suffix = lower(random_id.bucket_suffix.hex)


  # ----------------------------------------------------------------
  # DNS Context
  # ----------------------------------------------------------------
  # Route53 naming structure

  dns_context = {
    root_domain   = var.root_domain
    app_subdomain = local.normalized_app
    fqdn          = "${local.normalized_app}.${var.root_domain}"
  }

  # ----------------------------------------------------------------
  # Edge Authentication Header
  # ----------------------------------------------------------------

  edge_auth_header_name = "X-${local.name_prefix}-edge-auth-v1"
}