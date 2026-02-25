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