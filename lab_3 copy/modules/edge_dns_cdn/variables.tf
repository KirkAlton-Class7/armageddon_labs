# ----------------------------------------------------------------
# EDGE / DNS / CDN VARIABLES — Route53 Management
# ----------------------------------------------------------------

variable "manage_route53_in_terraform" {
  description = "Whether to manage Route53 hosted zone and records in Terraform."
  type        = bool
}

variable "route53_private_zone" {
  description = "Whether the Route53 hosted zone is private."
  type        = bool
}

# ----------------------------------------------------------------
# EDGE / DNS / CDN VARIABLES — Application Context
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
# EDGE / DNS / CDN VARIABLES — DNS Configuration
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
# EDGE / DNS / CDN VARIABLES — Edge Authentication
# ----------------------------------------------------------------

variable "edge_auth_header_name" {
  description = "Header name used for edge-to-origin authentication."
  type        = string
}

# ----------------------------------------------------------------
# EDGE / DNS / CDN VARIABLES — ALB Origin
# ----------------------------------------------------------------

variable "rds_app_public_alb_dns_name" {
  description = "DNS name of the public ALB."
  type        = string
}

variable "rds_app_public_alb_zone_id" {
  description = "Hosted zone ID of the public ALB."
  type        = string
}