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