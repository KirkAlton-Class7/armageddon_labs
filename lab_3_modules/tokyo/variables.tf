# ----------------------------------------------------------------
# INPUT VARIABLES — Application Identity
# ----------------------------------------------------------------

# Region Variable (set in .tfvars)
variable "region" {
  type = string
  description = "AWS region"
}

# Input Application Name
variable "app" {
  type        = string
  description = "Application name (short)"
  default     = "rds-app"
}

# Input Environment 
variable "env" {
  type        = string
  default     = "dev"
  description = "Input environment name (dev, test, prod)."

  validation {
    condition     = contains(["dev", "test", "prod"], var.env)
    error_message = "Environment must be: dev, test, or prod."
  }
}

# ----------------------------------------------------------------
# INPUT VARIABLES — Networking
# ----------------------------------------------------------------

# Input VPC CIDR Block
variable "vpc_cidr" {
  type    = string
  description = "CIDR block for the VPC"
  default = "10.10.0.0/16"
}

# ----------------------------------------------------------------
# INPUT VARIABLES — DNS / Route 53
# ----------------------------------------------------------------

# Toggle Route 53 in Terraform
variable "manage_route53_in_terraform" {
  description = "If true, create/manage Route53 hosted zone and records in Terraform."
  type        = bool
  default     = false
}

# Toggle Private Route 53 Zone
variable "route53_private_zone" {
  type        = bool
  description = "If true, the Route53 hosted zone is private."
  default     = false
}

# Input Root Domain (Apex)
variable "root_domain" {
  type        = string
  description = "Root DNS name (no subdomain)"
  default     = "kirkdevsecops.com"
}

# ----------------------------------------------------------------
# INPUT VARIABLES — Database
# ----------------------------------------------------------------
variable "secret_arn" {
  type        = string
  description = "ARN of database credentials secret"
}