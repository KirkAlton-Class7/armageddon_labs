# ----------------------------------------------------------------
# DNS — ACM Certificate Validation Records (CloudFront)
# ----------------------------------------------------------------
resource "aws_route53_record" "rds_app_cf_cert_validation" {
  provider = aws.regional
  
  allow_overwrite = true

  name = var.rds_app_cf_cert_domain_validation_options[0].resource_record_name

  records = [
    var.rds_app_cf_cert_domain_validation_options[0].resource_record_value
  ]

  ttl  = 60
  type = var.rds_app_cf_cert_domain_validation_options[0].resource_record_type

  zone_id = data.aws_route53_zone.rds_app_zone[0].zone_id
}

# ----------------------------------------------------------------
# DNS — TLS Certificate Validation (CloudFront)
# ----------------------------------------------------------------
resource "aws_acm_certificate_validation" "rds_app_cf_cert" {
  provider = aws.regional
  
  certificate_arn = var.rds_app_cf_cert_arn

  validation_record_fqdns = [
    aws_route53_record.rds_app_cf_cert_validation.fqdn
  ]
}

# ----------------------------------------------------------------
# DNS — ACM Certificate Validation Records (Regional ALB)
# ----------------------------------------------------------------
resource "aws_route53_record" "rds_app_cert_validation" {
  provider = aws.regional

  allow_overwrite = true

  name = var.rds_app_cert_domain_validation_options[0].resource_record_name

  records = [
    var.rds_app_cert_domain_validation_options[0].resource_record_value
  ]

  ttl  = 60
  type = var.rds_app_cert_domain_validation_options[0].resource_record_type

  zone_id = data.aws_route53_zone.rds_app_zone[0].zone_id
}

# ----------------------------------------------------------------
# DNS — Regional TLS Certificate Validation (ALB)
# ----------------------------------------------------------------
resource "aws_acm_certificate_validation" "rds_app_cert" {
  provider = aws.regional

  certificate_arn = var.rds_app_cert_arn

  validation_record_fqdns = [
    aws_route53_record.rds_app_cert_validation.fqdn
  ]
}

# # ----------------------------------------------------------------
# # DNS — ACM Certificate Validation Records (CloudFront)
# # ----------------------------------------------------------------
# resource "aws_route53_record" "rds_app_cf_cert_validation" {

#   for_each = {
#     for dvo in var.rds_app_cf_cert_domain_validation_options :
#     dvo.domain_name => {
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
# # DNS — TLS Certificate Validation (CloudFront)
# # ----------------------------------------------------------------

# resource "aws_acm_certificate_validation" "rds_app_cf_cert" {

#   certificate_arn = var.rds_app_cf_cert_arn

#   validation_record_fqdns = [
#     for record in aws_route53_record.rds_app_cf_cert_validation :
#     record.fqdn
#   ]
# }

# # ----------------------------------------------------------------
# # DNS — ACM Certificate Validation Records (Regional ALB)
# # ----------------------------------------------------------------
# resource "aws_route53_record" "rds_app_cert_validation" {

#   for_each = {
#     for dvo in var.rds_app_cert_domain_validation_options :
#     dvo.domain_name => {
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
# # DNS — Regional TLS Certificate Validation (ALB)
# # ----------------------------------------------------------------

# resource "aws_acm_certificate_validation" "rds_app_cert" {
#   certificate_arn = var.rds_app_cert_arn

#   validation_record_fqdns = [
#     for record in aws_route53_record.rds_app_cert_validation :
#     record.fqdn
#   ]
# }

# TODO Delete unnecessary comments.