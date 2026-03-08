# ----------------------------------------------------------------
# EDGE VARIABLES — Application Context
# ----------------------------------------------------------------

variable "context" {
  description = "Deployment context containing region, application name, environment, and common tags."
  type = object(
    {
      region = string
      app    = string
      env    = string
      tags   = map(string)
    }
  )
}

variable "name_prefix" {
  description = "Prefix for resource names."
  type        = string
}

variable "name_suffix" {
  description = "Suffix for resource names."
  type        = string
}

# ----------------------------------------------------------------
# EDGE VARIABLES — DNS Configuration
# ----------------------------------------------------------------

variable "dns_context" {
  description = "DNS configuration containing root domain, subdomain, and FQDN."
  type = object({
    root_domain   = string
    app_subdomain = string
    fqdn          = string
  })
}

# ----------------------------------------------------------------
# EDGE VARIABLES — Route53 Management
# ----------------------------------------------------------------

# variable "manage_route53_in_terraform" {
#   description = "Whether to manage Route53 hosted zone and records in Terraform."
#   type        = bool
# }

# variable "route53_private_zone" {
#   description = "Whether the Route53 hosted zone is private."
#   type        = bool
# }

# ----------------------------------------------------------------
# EDGE VARIABLES — CloudFront Certificate Validation
# ----------------------------------------------------------------

variable "rds_app_cf_cert_validation_fqdns" {
  description = "FQDNs of Route53 validation records used to validate the CloudFront ACM certificate."
  type        = list(string)
}

# ----------------------------------------------------------------
# EDGE VARIABLES — Edge Authentication
# ----------------------------------------------------------------

variable "edge_auth_header_name" {
  description = "Header name used for edge-to-origin authentication."
  type        = string
}

variable "edge_auth_value" {
  description = "Secret header value used by CloudFront to authenticate to the ALB origin."
  type        = string
  sensitive   = true
}