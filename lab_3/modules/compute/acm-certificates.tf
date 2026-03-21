# ----------------------------------------------------------------
# COMPUTE - ACM Certificate (ALB)
# ----------------------------------------------------------------
# Regional TLS Certificate
resource "aws_acm_certificate" "rds_app_cert" {
  provider = aws.regional
  
  domain_name               = var.dns_context.root_domain
  subject_alternative_names = ["*.${var.dns_context.root_domain}"]
  validation_method         = "DNS"

  tags = {
    Name = "${var.context.app}-cert"
  }

  lifecycle {
    create_before_destroy = true
  }
}

# -------------------------------------------------------------------
# COMPUTE - DNS Validation Records for ACM Certificater (ALB)
# -------------------------------------------------------------------
resource "aws_route53_record" "rds_app_cert_validation" {
  provider = aws.regional

  # ACM may return duplicate validation records (e.g., root + wildcard domains).
  # Use grouping (...) to avoid duplicate key errors in for_each.
  for_each = {
    for dvo in aws_acm_certificate.rds_app_cert.domain_validation_options :
    dvo.resource_record_name => dvo... # Elipses are used to access the list of values in dvo
  }

  allow_overwrite = true

  # When grouping is used, each.value is a list. Reference the first element.
  name    = each.value[0].resource_record_name
  records = [each.value[0].resource_record_value]
  ttl     = 60
  type    = each.value[0].resource_record_type

  zone_id = var.zone_id
}

# ----------------------------------------------------------------
# COMPUTE — ACM Certificate Validation (ALB)
# ----------------------------------------------------------------
# DNS Validation
resource "aws_acm_certificate_validation" "rds_app_cert" {
  provider = aws.regional

  certificate_arn = aws_acm_certificate.rds_app_cert.arn

  validation_record_fqdns = [
    for record in aws_route53_record.rds_app_cert_validation :
    record.fqdn
  ]
}