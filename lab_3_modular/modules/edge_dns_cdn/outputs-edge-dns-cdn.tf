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


# Edge Auth Token (Header Value)
output "edge_auth_value" {
  description = "Edge Auth Token (Header Value)"
  value = random_password.edge_auth_value.result
}

# CloudFront Origin Configuration
output "cloudfront_origin" {
  description = "CloudFront origin configuration"

  value = {
    origin_domain          = "origin.${var.dns_context.root_domain}"
    origin_alb_dns         = var.rds_app_public_alb_zone_id
    origin_protocol_policy = "https-only"
  }
}


output "cloudfront_domain" {
  value = aws_cloudfront_distribution.rds_app.domain_name
}
















output "rds_app_origin_record" {
  description = "Route53 A record pointing origin to ALB"
  value = {
    fqdn    = aws_route53_record.rds_app_origin_to_alb.fqdn
    name    = aws_route53_record.rds_app_origin_to_alb.name
    zone_id = aws_route53_record.rds_app_origin_to_alb.zone_id
    type    = aws_route53_record.rds_app_origin_to_alb.type
  }
}


# variable "rds_app_origin_record" {
#   description = "Route53 origin record pointing to ALB"
#   type = object({
#     fqdn    = string
#     name    = string
#     zone_id = string
#     type    = string
#   })
# }









# ----------------------------------------------------------------
# OUTPUT — RDS App ACM Certificate ARN
# ----------------------------------------------------------------
output "rds_app_cert_arn" {
  description = "ARN of the ACM certificate used by the ALB"
  value       = aws_acm_certificate.rds_app_cert.arn
}

# variable "rds_app_cert_arn" {
#   description = "ARN of ACM certificate for the ALB HTTPS listener"
#   type        = string
# }