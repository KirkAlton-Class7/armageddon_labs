# ----------------------------------------------------------------
# EDGE OUTPUTS — CloudFront Certificate Validation Options
# ----------------------------------------------------------------

output "rds_app_cf_cert_domain_validation_options" {
  description = "Domain validation options for the CloudFront ACM certificate."
  value       = aws_acm_certificate.rds_app_cf_cert.domain_validation_options
}

# ----------------------------------------------------------------
# EDGE OUTPUTS — CloudFront ACM Certificate ARN
# ----------------------------------------------------------------

output "rds_app_cf_cert_arn" {
  description = "ACM certificate ARN used by CloudFront."
  value       = aws_acm_certificate.rds_app_cf_cert.arn
}

# ----------------------------------------------------------------
# EDGE OUTPUTS — Application Access
# ----------------------------------------------------------------

output "application_url" {
  description = "Application HTTPS URL."
  value = {
    url = "https://${var.dns_context.fqdn}"
  }
}

# ---------------------------------------------------------------------
# EDGE OUTPUTS — CloudFront (Edge Security / Control Plane)
# ---------------------------------------------------------------------

output "cloudfront_distribution" {
  description = "CloudFront distribution details."

  value = {
    id          = aws_cloudfront_distribution.rds_app.id
    arn         = aws_cloudfront_distribution.rds_app.arn
    domain_name = aws_cloudfront_distribution.rds_app.domain_name
    hosted_zone_id = aws_cloudfront_distribution.rds_app.hosted_zone_id
    status      = aws_cloudfront_distribution.rds_app.status
  }
}

output "cloudfront_tls" {
  description = "CloudFront TLS configuration."

  value = {
    certificate_arn          = aws_acm_certificate.rds_app_cf_cert.arn
    minimum_protocol_version = "TLSv1.2_2021"
    ssl_support_method       = "sni-only"
  }
}

# ----------------------------------------------------------------
# EDGE OUTPUTS — CloudFront (Edge / Public Access)
# ----------------------------------------------------------------

output "cloudfront_endpoints" {
  description = "Public DNS endpoints for CloudFront."

  value = {
    apex_domain     = var.dns_context.root_domain
    subdomain       = var.dns_context.fqdn
    cloudfront_host = aws_cloudfront_distribution.rds_app.domain_name
  }
}

# ----------------------------------------------------------------
# EDGE OUTPUTS — CloudFront (Edge Origin)
# ----------------------------------------------------------------

output "edge_auth_value" {
  description = "Edge authentication header value."
  value       = var.edge_auth_value
}

output "cloudfront_origin" {
  description = "CloudFront origin configuration."

  value = {
    origin_domain          = "origin.${var.dns_context.root_domain}"
    origin_protocol_policy = "https-only"
  }
}

output "cloudfront_domain" {
  description = "CloudFront distribution domain name."
  value       = aws_cloudfront_distribution.rds_app.domain_name
}