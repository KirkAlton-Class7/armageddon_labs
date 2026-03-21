# ----------------------------------------------------------------
# DNS VARIABLES — Application Context
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
# DNS VARIABLES — Route53 Management
# ----------------------------------------------------------------

variable "manage_route53_in_terraform" {
  description = "Whether to manage Route53 hosted zone and records in Terraform."
  type        = bool
}

variable "route53_private_zone" {
  description = "Whether the Route53 hosted zone is private."
  type        = bool
}

variable "is_dns_writer" {
  description = "Whether this stack owns DNS record creation"
  type        = bool
}

# ----------------------------------------------------------------
# DNS VARIABLES — DNS Configuration
# ----------------------------------------------------------------

variable "dns_context" {
  description = "DNS configuration containing root domain, subdomain, and FQDN."
  type = object({
    root_domain   = string
    app_subdomain = string
    fqdn          = string
  })
}

# # ----------------------------------------------------------------
# # DNS VARIABLES — Regional ACM Certificate ARN (ALB)
# # ----------------------------------------------------------------

# variable "rds_app_cert_arn" {
#   description = "ACM certificate ARN used by the ALB."
#   type        = string
# }

# # ----------------------------------------------------------------
# # DNS VARIABLES — CloudFront ACM Certificate ARN
# # ----------------------------------------------------------------

# variable "rds_app_cf_cert_arn" {
#   description = "ACM certificate ARN used by CloudFront."
#   type        = string
# }



# # ----------------------------------------------------------------
# # DNS VARIABLES — CloudFront Domain Certificate Validation
# # ----------------------------------------------------------------

# variable "rds_app_cf_cert_domain_validation_options" {
#   description = "Domain validation options for the CloudFront ACM certificate."
#   type = list(object({
#     domain_name           = string
#     resource_record_name  = string
#     resource_record_type  = string
#     resource_record_value = string
#   }))
# }

# # ----------------------------------------------------------------
# # DNS VARIABLES — ALB Regional Certificate Validation
# # ----------------------------------------------------------------
# variable "rds_app_cert_domain_validation_options" {
#   description = "Domain validation options for the regional ACM certificate."
#   type = list(object({
#     domain_name           = string
#     resource_record_name  = string
#     resource_record_type  = string
#     resource_record_value = string
#   }))
# }

# ----------------------------------------------------------------
# DNS VARIABLES — ALB Origin
# ----------------------------------------------------------------

variable "rds_app_public_alb_dns_name" {
  description = "DNS name of the public ALB."
  type        = string
}

variable "rds_app_public_alb_zone_id" {
  description = "Hosted zone ID of the public ALB."
  type        = string
}