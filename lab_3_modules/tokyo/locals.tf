


locals {
  # -------------------------------------------------------------------
  # Core Identity, Deployment Context, and Naming
  # -------------------------------------------------------------------

  # Account ID
  account_id = data.aws_caller_identity.current.account_id

  # Environment
  app    = var.context.app
  env    = var.context.env
  tags   = var.context.tags
  region = var.context.region

  # Normalized Environment Names
  normalized_app = lower(var.app) # Normalization defines identity here, so transformation belongs in root.
  normalized_env = lower(var.env)

  # Base Tags
  base_tags = {
    Region      = var.region
    Application = local.normalized_app
    Environment = local.normalized_env
  }

  # Deployment Context
  context = {
    region = var.region
    app    = local.normalized_app
    env    = local.normalized_env
    tags   = local.base_tags
  }

  # Naming helpers
  name_prefix   = "${local.app}-${local.env}"
  name_suffix   = lower(random_string.suffix.result) # Root level normalization; preferred only if normalization defines deployment identity. 
  bucket_suffix = lower(random_id.bucket_suffix.hex)


  # Normalized DB Engine
  normalized_db_engine = lower(var.db_engine)



# Your work proves that you belong there. Your results [and] your outcomes prove that you belong . . . and your mindset must also prove it. Don't ever let anybody make you feel as if you don't belong.


  # Route53 Naming
  root_domain   = var.root_domain
  app_subdomain = var.app
  fqdn          = "${local.app_subdomain}.${local.root_domain}"
}