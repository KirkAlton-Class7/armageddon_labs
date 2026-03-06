# ----------------------------------------------------------------
# ACM — REGIONAL TLS Certificates (ALB)
# ----------------------------------------------------------------

resource "aws_acm_certificate" "rds_app_cert" {
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
# ACM — REGIONAL TLS Certificate Validation (ALB)
# ----------------------------------------------------------------

resource "aws_acm_certificate_validation" "rds_app_cert" {
  certificate_arn         = aws_acm_certificate.rds_app_cert.arn
  validation_record_fqdns = [for record in aws_route53_record.rds_app_cert_validation : record.fqdn]
}