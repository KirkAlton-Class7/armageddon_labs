# ----------------------------------------------------------------
# EDGE / DNS / CDN — Input Variables (Route53 Management)
# ----------------------------------------------------------------

variable "manage_route53_in_terraform" {
  description = "If true, create/manage Route53 hosted zone and records in Terraform."
  type        = bool
}

variable "route53_private_zone" {
  type        = bool
  description = "If true, the Route53 hosted zone is private."
}

# ----------------------------------------------------------------
# EDGE / DNS / CDN — Input Variables (Application Context)
# ----------------------------------------------------------------

variable "context" {
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
  type = string
}

variable "name_suffix" {
  type = string
}

# ----------------------------------------------------------------
# EDGE / DNS / CDN — Input Variables (DNS Configuration)
# ----------------------------------------------------------------

variable "dns_context" {
  type = object({
    root_domain   = string
    app_subdomain = string
    fqdn          = string
  })
}

# ----------------------------------------------------------------
# EDGE / DNS / CDN — Input Variables (Edge Authentication)
# ----------------------------------------------------------------

variable "edge_auth_header_name" {
  type        = string
  description = "Edge authentication header name."
}

# ----------------------------------------------------------------
# EDGE / DNS / CDN — Input Variables (ALB Origin)
# ----------------------------------------------------------------

variable "rds_app_public_alb_dns_name" {
  description = "DNS name of the public ALB"
  type        = string
}

variable "rds_app_public_alb_zone_id" {
  description = "Canonical hosted zone ID of the ALB"
  type        = string
}