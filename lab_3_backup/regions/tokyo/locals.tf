# ----------------------------------------------------------------
# TOKYO - Locals
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
  # Database Configuration
  # ----------------------------------------------------------------

  normalized_db_engine = lower(var.db_engine)

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
  # Derived from deployment identity
  # Replace with a fixed header if preferred.

  edge_auth_header_name = "X-${local.name_prefix}-edge-auth-v1"

  # ----------------------------------------------------------------
  # WAF Logging Configuration
  # ----------------------------------------------------------------

  waf_log_mode_map = {
    cloudwatch = {
      create_direct_resources   = true
      create_firehose_resources = false
      target                    = "cloudwatch"
    }

    firehose = {
      create_direct_resources   = false
      create_firehose_resources = true
      target                    = "firehose"
    }

    s3 = {
      create_direct_resources   = true
      create_firehose_resources = false
      target                    = "s3"
    }
  }

  # Selected WAF log mode
  waf_log_mode = local.waf_log_mode_map[var.waf_log_destination]

  # ----------------------------------------------------------------
  # Validation and Safety Logic
  # ----------------------------------------------------------------
  # Ensures only one logging path is active.

  waf_log_mode_valid = (
    (local.waf_log_mode.create_direct_resources && !local.waf_log_mode.create_firehose_resources) ||
    (!local.waf_log_mode.create_direct_resources && local.waf_log_mode.create_firehose_resources)
  )

}