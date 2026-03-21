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

variable "zone_id" {
  description = "Route53 hosted zone ID for DNS validation records."
  type        = string
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