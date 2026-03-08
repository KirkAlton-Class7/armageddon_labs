# # ----------------------------------------------------------------
# # GLOBAL OUTPUTS — Security
# # ----------------------------------------------------------------

# output "edge_auth_value" {
#   value = module.edge.edge_auth_value
#   sensitive = true
# }

# ----------------------------------------------------------------
# GLOBAL OUTPUTS — Application Access
# ----------------------------------------------------------------

output "application_url" {
  description = "Application HTTPS URL served through CloudFront."
  value       = module.edge.application_url.url
}

# ----------------------------------------------------------------
# GLOBAL OUTPUTS — CloudFront Distribution
# ----------------------------------------------------------------

output "cloudfront_distribution" {
  description = "CloudFront distribution details."

  value = {
    id             = module.edge.cloudfront_distribution.id
    arn            = module.edge.cloudfront_distribution.arn
    domain_name    = module.edge.cloudfront_distribution.domain_name
    hosted_zone_id = module.edge.cloudfront_distribution.hosted_zone_id
    status         = module.edge.cloudfront_distribution.status
  }
}

# ----------------------------------------------------------------
# GLOBAL OUTPUTS — Regional Certificate Validation
# ----------------------------------------------------------------

output "rds_app_cert_validation_fqdns" {
  description = "DNS validation record FQDNs for the regional ALB ACM certificate."
  value       = module.dns.rds_app_cert_validation_fqdns
}

# ----------------------------------------------------------------
# DNS OUTPUTS — CloudFront Certificate Validation Records
# ----------------------------------------------------------------

output "rds_app_cf_cert_validation_fqdns" {
  description = "FQDNs used for CloudFront certificate validation."

  value = module.dns.rds_app_cf_cert_validation_fqdns
}