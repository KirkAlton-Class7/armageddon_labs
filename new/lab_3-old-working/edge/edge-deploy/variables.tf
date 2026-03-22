# ----------------------------------------------------------------
# EDGE DEPLOY VARIABLES — Application Identity
# ----------------------------------------------------------------

variable "region" {
  description = "AWS region."
  type        = string
  default     = "us-east-1"
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
# EDGE DEPLOY VARIABLES — Route53 Management
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

variable "is_dns_writer" {
  description = "Whether this stack owns DNS record creation"
  default     = false
  type        = bool
}

variable "root_domain" {
  description = "Root DNS domain."
  type        = string
  default     = "kirkdevsecops.com"
}