# ----------------------------------------------------------------
# TGW CONNECTIONS — Locals
# ----------------------------------------------------------------

locals {

  # ----------------------------------------------------------------
  # Core Identity
  # ----------------------------------------------------------------

  account_id = data.aws_caller_identity.current.account_id

  # ----------------------------------------------------------------
  # Normalized Deployment Identity
  # ----------------------------------------------------------------

  normalized_app = lower(var.app)
  normalized_env = lower(var.env)

  # ----------------------------------------------------------------
  # Topology Identity
  # ----------------------------------------------------------------

  peering_name = "${var.source_region}-${var.peer_region}"

  # ----------------------------------------------------------------
  # Base Tags
  # ----------------------------------------------------------------

  base_tags = {
    Region      = "multi-region"
    Application = local.normalized_app
    Environment = local.normalized_env
    Scope       = "tgw-peering"
    Topology    = local.peering_name
  }

  # ----------------------------------------------------------------
  # Deployment Context Object
  # ----------------------------------------------------------------

  context = {
    region = "multi-region"
    app    = local.normalized_app
    env    = local.normalized_env
    tags   = local.base_tags
  }

  # ----------------------------------------------------------------
  # Naming Helpers
  # ----------------------------------------------------------------

  name_prefix = local.context.app
  name_suffix = local.context.env

}