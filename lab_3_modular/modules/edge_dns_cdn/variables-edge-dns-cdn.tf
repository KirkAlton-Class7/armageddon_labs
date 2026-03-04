# ----------------------------------------------------------------
# INPUT VARIABLES — EDGE / DNS / Route 53
# ----------------------------------------------------------------

# Toggle Route 53 Zone Management in Terraform
variable "manage_route53_in_terraform" {
  description = "If true, create/manage Route53 hosted zone and records in Terraform."
  type        = bool
}


# Toggle Private Route 53 Zone
variable "route53_private_zone" {
  type        = bool
  description = "If true, the Route53 hosted zone is private."
}




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

# Name Suffix
variable "name_suffix" {
  type = string
}

# DNS Context
variable "dns_context" {
  type = object({
    root_domain   = string
    app_subdomain = string
    fqdn          = string
  })
}

  # Edge Authentication Header Name
variable "edge_auth_header_name" {
  type        = string
  description = "Edge authentication header name."
}


# ----------------------------------------------------------------
# INPUT — ALB DNS Name
# ----------------------------------------------------------------
variable "rds_app_public_alb_dns_name" {
  description = "DNS name of the public ALB"
  type        = string
}


# ----------------------------------------------------------------
# INPUT — ALB Zone ID
# ----------------------------------------------------------------
variable "rds_app_public_alb_zone_id" {
  description = "Canonical hosted zone ID of the ALB"
  type        = string
}
