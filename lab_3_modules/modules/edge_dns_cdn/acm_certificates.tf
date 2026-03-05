# ----------------------------------------------------------------
# EDGE — TLS Certificates (CloudFront)
# ----------------------------------------------------------------

resource "aws_acm_certificate" "rds_app_cf_cert" {
  provider                  = aws.global # us-east-1 required for CloudFront
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
# EDGE — TLS Certificate Validation (CloudFront)
# ----------------------------------------------------------------

resource "aws_acm_certificate_validation" "rds_app_cf_cert" {
  provider                = aws.global
  certificate_arn         = aws_acm_certificate.rds_app_cf_cert.arn
  validation_record_fqdns = [for record in aws_route53_record.rds_app_cf_cert_validation : record.fqdn]
}

# ----------------------------------------------------------------
# REGIONAL — TLS Certificates (ALB)
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
# REGIONAL — TLS Certificate Validation (ALB)
# ----------------------------------------------------------------

resource "aws_acm_certificate_validation" "rds_app_cert" {
  certificate_arn         = aws_acm_certificate.rds_app_cert.arn
  validation_record_fqdns = [for record in aws_route53_record.rds_app_cert_validation : record.fqdn]
}