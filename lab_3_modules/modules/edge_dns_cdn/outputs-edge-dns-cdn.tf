# ----------------------------------------------------------------
# OUTPUTS — Application Access
# ----------------------------------------------------------------

# Application URL
output "application_url" {
  description = "URL for accessing the application"
  value = {
    url = "https://${var.dns_context.fqdn}"
  }
}

# ----------------------------------------------------------------
# OUTPUTS — DNS
# ----------------------------------------------------------------

# Route53 Hosted Zone Info
output "route53_zone" {
  description = "Route53 hosted zone information"

  value = {
    arn          = data.aws_route53_zone.rds_app_zone[0].arn
    id           = data.aws_route53_zone.rds_app_zone[0].zone_id
    name         = data.aws_route53_zone.rds_app_zone[0].name
    name_servers = data.aws_route53_zone.rds_app_zone[0].name_servers
    comment      = data.aws_route53_zone.rds_app_zone[0].comment
  }
}


# ----------------------------------------------------------------
# OUTPUTS — CloudFront (Edge Security / Control Plane)
# ----------------------------------------------------------------

# CloudFront Distribution Info
output "cloudfront_distribution" {
  description = "CloudFront distribution information"

  value = {
    id          = aws_cloudfront_distribution.rds_app.id
    arn         = aws_cloudfront_distribution.rds_app.arn
    domain_name = aws_cloudfront_distribution.rds_app.domain_name
    status      = aws_cloudfront_distribution.rds_app.status
  }
}

# CloudFront TLS Certificate Configuration
output "cloudfront_tls" {
  description = "CloudFront TLS certificate configuration"

  value = {
    certificate_arn          = aws_acm_certificate.rds_app_cf_cert.arn
    minimum_protocol_version = "TLSv1.2_2021"
    ssl_support_method       = "sni-only"
  }
}

# ----------------------------------------------------------------
# OUTPUTS — CloudFront (Edge / Public Access)
# ----------------------------------------------------------------

# Public Edge Endpoints
output "cloudfront_endpoints" {
  description = "Public DNS endpoints routed to CloudFront"

  value = {
    apex_domain     = var.dns_context.root_domain
    subdomain       = var.dns_context.fqdn
    cloudfront_host = aws_cloudfront_distribution.rds_app.domain_name
  }
}


# ----------------------------------------------------------------
# OUTPUTS — CloudFront (Edge Origin)
# ----------------------------------------------------------------

# CloudFront Origin Configuration
output "cloudfront_origin" {
  description = "CloudFront origin configuration"

  value = {
    origin_domain          = "origin.${var.dns_context.root_domain}"
    origin_alb_dns         = aws_lb.rds_app_public_alb.dns_name
    origin_protocol_policy = "https-only"
  }
}
