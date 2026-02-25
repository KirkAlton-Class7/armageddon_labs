locals {
  # -------------------------------------------------------------------
  # Core Identity, Environment, and Naming
  # -------------------------------------------------------------------
  # Account ID
  account_id = data.aws_caller_identity.current.account_id

  # Environment setup
  env = lower(var.env)
  app = var.app

  # VPC CIDR
  vpc_cidr = var.vpc_cidr

  # Route53 Naming
  root_domain   = var.root_domain
  app_subdomain = var.app
  fqdn          = "${local.app_subdomain}.${local.root_domain}"

  # Base Tags
  base_tags = {
    Environment = "${local.env}"
  }

  # Naming helpers
  name_prefix   = "${local.app}-${local.env}"
  name_suffix   = lower(random_string.suffix.result)
  bucket_suffix = random_id.bucket_suffix.hex
}
