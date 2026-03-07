# ----------------------------------------------------------------
# GLOBAL — Locals
# ----------------------------------------------------------------

locals {

  # ----------------------------------------------------------------
  # Core Identity
  # ----------------------------------------------------------------

  # AWS Account ID
  account_id = data.aws_caller_identity.current.account_id


  # ----------------------------------------------------------------
  # Normalized Deployment Identity
  # ----------------------------------------------------------------

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

  name_prefix = "${local.context.app}-${local.context.env}"
  name_suffix = lower(random_string.suffix.result)


  # ----------------------------------------------------------------
  # DNS Context
  # ----------------------------------------------------------------

  dns_context = {
    root_domain   = var.root_domain
    app_subdomain = local.normalized_app
    fqdn          = "${local.normalized_app}.${var.root_domain}"
  }

    # ----------------------------------------------------------------
  # Edge Authentication Header
  # ----------------------------------------------------------------
  # Derived from deployment identity
  # Replace with a fixed header if preferred.

  edge_auth_header_name = "X-${local.name_prefix}-edge-auth-v1"
}