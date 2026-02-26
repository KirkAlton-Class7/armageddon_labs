locals {
  
  account_id = var.account_id


  # Environment
  app  = var.context.app
  env  = var.context.env
  tags = var.context.tags
  region = var.context.region

  # Naming helpers
  name_prefix   = "${local.app}-${local.env}"
  name_suffix   = lower(var.name_suffix)
  #bucket_suffix = var.bucket_suffix
}