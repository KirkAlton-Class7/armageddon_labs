# ----------------------------------------------------------------
# DNS — Validation Records (CloudFront Certificate)
# ----------------------------------------------------------------
resource "aws_route53_record" "rds_app_cf_cert_validation" {

  for_each = {
    for idx, dvo in var.rds_app_cf_cert_domain_validation_options : idx => dvo
  }

  allow_overwrite = true
  name            = each.value.resource_record_name
  records         = [each.value.resource_record_value]
  ttl             = 60
  type            = each.value.resource_record_type
  zone_id         = data.aws_route53_zone.rds_app_zone[0].zone_id
}

# ----------------------------------------------------------------
# DNS — Validation Records (Regional Certificate)
# ----------------------------------------------------------------
resource "aws_route53_record" "rds_app_cert_validation" {

  for_each = {
    for idx, dvo in var.rds_app_cert_domain_validation_options : idx => dvo
  }

  allow_overwrite = true
  name            = each.value.resource_record_name
  records         = [each.value.resource_record_value]
  ttl             = 60
  type            = each.value.resource_record_type
  zone_id         = data.aws_route53_zone.rds_app_zone[0].zone_id
}


# # ----------------------------------------------------------------
# # DNS — Validation Records (CloudFront Certificate)
# # ----------------------------------------------------------------
# resource "aws_route53_record" "rds_app_cf_cert_validation" {
#   for_each = {
#     for dvo in aws_acm_certificate.rds_app_cf_cert.domain_validation_options : dvo.domain_name => {
#       name   = dvo.resource_record_name
#       record = dvo.resource_record_value
#       type   = dvo.resource_record_type
#     }
#   }

#   allow_overwrite = true
#   name            = each.value.name
#   records         = [each.value.record]
#   ttl             = 60
#   type            = each.value.type
#   zone_id         = data.aws_route53_zone.rds_app_zone[0].zone_id
# }

# # ----------------------------------------------------------------
# # DNS — Validation Records (Regional Certificate)
# # ----------------------------------------------------------------
# resource "aws_route53_record" "rds_app_cert_validation" {
#   for_each = {
#     for dvo in var.rds_app_cert_domain_validation_options : dvo.domain_name => {
#       name   = dvo.resource_record_name
#       record = dvo.resource_record_value
#       type   = dvo.resource_record_type
#     }
#   }

#   allow_overwrite = true
#   name            = each.value.name
#   records         = [each.value.record]
#   ttl             = 60
#   type            = each.value.type
#   zone_id         = data.aws_route53_zone.rds_app_zone[0].zone_id
# }