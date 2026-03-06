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
# TOKYO VARIABLES — Edge / DNS / CDN
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

variable "root_domain" {
  description = "Root DNS domain."
  type        = string
  default     = "kirkdevsecops.com"
}

# ----------------------------------------------------------------
# COMPUTE VARIABLES — Security
# ----------------------------------------------------------------

variable "edge_auth_header_name" {
  description = "Header name used for edge-to-origin authentication."
  type        = string
}

variable "edge_auth_value" {
  description = "Header value used for edge-to-origin authentication."
  type        = string
  sensitive   = true
}