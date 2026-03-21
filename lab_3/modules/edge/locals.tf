# # ----------------------------------------------------------------
# # EDGE / DNS / CDN — Locals
# # ----------------------------------------------------------------
locals {
  # ----------------------------------------------------------------
  # LOCALS — ACM Certificate Validation Options (CloudFront)
  # ----------------------------------------------------------------
  # Convert set → list and select first validation option (root/wildcard share validation)
  # Ensures deterministic plan without dynamic for_each
  # https://fivexl.io/blog/aws_acm_certificate/

  rds_app_cf_certificate_validation_options = tolist(aws_acm_certificate.rds_app_cf_cert.domain_validation_options)[0]
}


# locals {
#   # -------------------------------------------------------------------
#   # Route53 Zone Resolution (Managed or Existing)
#   # -------------------------------------------------------------------
#   # Tries Terraform-managed hosted zone first.
#   # If null (toggled off with variable), falls back to zone_id in the existing data source.
#   route53_zone_id = coalesce(
#     try(aws_route53_zone.terraform_managed_zone[0].zone_id, null),
#     data.aws_route53_zone.rds_app_zone[0].zone_id,
#     null
#   )
# }