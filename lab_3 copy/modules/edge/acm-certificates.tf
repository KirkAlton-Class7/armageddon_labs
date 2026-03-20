# ----------------------------------------------------------------
# EDGE — TLS Certificate (CloudFront)
# ----------------------------------------------------------------

resource "aws_acm_certificate" "rds_app_cf_cert" {
  domain_name               = var.dns_context.root_domain
  subject_alternative_names = ["*.${var.dns_context.root_domain}"] # Use wildcard to cover one level subdomains
  validation_method         = "DNS"

  tags = {
    Name = "${var.context.app}-cert"
  }

  lifecycle {
    create_before_destroy = true
  }
}

# ----------------------------------------------------------------
# EDGE — ACM Certificate Validation (CloudFront)
# ----------------------------------------------------------------

resource "aws_acm_certificate_validation" "rds_app_cf_cert" {
  certificate_arn         = aws_acm_certificate.rds_app_cf_cert.arn
  validation_record_fqdns = var.rds_app_cf_cert_validation_fqdns
}