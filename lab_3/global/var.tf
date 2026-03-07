# ----------------------------------------------------------------
# TOKYO VARIABLES — Application Identity
# ----------------------------------------------------------------

variable "region" {
  description = "AWS region."
  type        = string
  default     = "us-west-2"
}

variable "app" {
  description = "Application name."
  type        = string
  default     = "rds-app"
}

variable "env" {
  description = "Deployment environment (dev, test, prod)."
  type        = string
  default     = "dev"

  validation {
    condition     = contains(["dev", "test", "prod"], var.env)
    error_message = "Environment must be: dev, test, or prod."
  }
}

# ----------------------------------------------------------------
# GLOBAL VARIABLES — DNS Configuration
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
# GLOBAL VARIABLES — Route53 Management
# ----------------------------------------------------------------

variable "manage_route53_in_terraform" {
  description = "Manage Route53 hosted zone and records in Terraform."
  type        = bool
  default     = false
}

variable "route53_private_zone" {
  description = "Whether the Route53 hosted zone is private."
  type        = bool
  default     = false
}