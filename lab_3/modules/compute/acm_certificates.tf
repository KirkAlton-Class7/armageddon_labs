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