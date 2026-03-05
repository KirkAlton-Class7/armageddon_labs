locals {
  # -------------------------------------------------------------------
  # Route53 Zone Resolution (Managed or Existing)
  # -------------------------------------------------------------------
  # Tries Terraform-managed hosted zone first.
  # If null (toggled off with variable), falls back to zone_id in the existing data source.
  route53_zone_id = coalesce(
    try(aws_route53_zone.terraform_managed_zone[0].zone_id, null),
    data.aws_route53_zone.rds_app_zone[0].zone_id, null
  )
}