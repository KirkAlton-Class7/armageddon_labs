# ================================================================
# DNS — ACM CERTIFICATE VALIDATION RECORDS
# ================================================================

# ----------------------------------------------------------------
# DNS — Validation Records for ACM Cert Records (CLOUDFRONT)
# ----------------------------------------------------------------
resource "aws_route53_record" "rds_app_cf_cert_validation" {
  for_each = {
    for dvo in aws_acm_certificate.rds_app_cf_cert.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = data.aws_route53_zone.rds_app_zone[0].zone_id
}


# ----------------------------------------------------------------
# DNS — Validation Records for ACM Cert Records (REGIONAL)
# ----------------------------------------------------------------
resource "aws_route53_record" "rds_app_cert_validation" {
  for_each = {
    for dvo in aws_acm_certificate.rds_app_cert.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = data.aws_route53_zone.rds_app_zone[0].zone_id
}