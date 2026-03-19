# ----------------------------------------------------------------
# COMPUTE VARIABLES — Application Context
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

variable "ami_id" {
  description = "Golden AMI for compute instances"
  type        = string
}

# ----------------------------------------------------------------
# COMPUTE VARIABLES — Networking
# ----------------------------------------------------------------

variable "vpc_id" {
  description = "VPC ID for compute resources."
  type        = string
}

variable "public_subnet_ids" {
  description = "Public subnet IDs for internet-facing resources."
  type        = list(string)
}

variable "private_app_subnet_ids" {
  description = "Private subnet IDs for application compute resources."
  type        = list(string)
}

variable "public_subnet_tags" {
  description = "Tags applied to public subnet resources."
  type        = map(string)
}

variable "private_app_subnet_tags" {
  description = "Tags applied to private application subnet resources."
  type        = map(string)
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

# ----------------------------------------------------------------
# COMPUTE VARIABLES — IAM
# ----------------------------------------------------------------

variable "iam_role_rds_app_name" {
  description = "IAM role name for RDS application instances."
  type        = string
}

variable "rds_app_instance_profile_name" {
  description = "Instance profile name for RDS application instances."
  type        = string
}

# ----------------------------------------------------------------
# COMPUTE VARIABLES — Security Groups
# ----------------------------------------------------------------

variable "rds_app_asg_sg_id" {
  description = "Security group ID for RDS application Auto Scaling instances."
  type        = string
}

variable "alb_origin_sg_id" {
  description = "Security group ID for the origin Application Load Balancer."
  type        = string
}


# ----------------------------------------------------------------
# COMPUTE VARIABLES — DNS Configuration
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
# COMPUTE VARIABLES — Certificate Validation (Regional ALB)
# ----------------------------------------------------------------

# variable "rds_app_cert_validation_fqdns" {
#   description = "FQDNs of the Route53 validation records used to validate the regional ALB ACM certificate."
#   type        = list(string)
# }

# ----------------------------------------------------------------
# COMPUTE VARIABLES — Secrets
# ----------------------------------------------------------------

variable "db_secret_arn" {
  description = "Secrets Manager ARN containing database credentials."
  type        = string
}

# ----------------------------------------------------------------
# COMPUTE VARIABLES — ALB Logging
# ----------------------------------------------------------------

variable "alb_log_s3" {
  description = "Enable ALB access logging to S3."
  type        = bool
}

variable "alb_access_logs_prefix" {
  description = "S3 key prefix for ALB access logs."
  type        = string
}

variable "alb_logs_bucket_id" {
  description = "S3 bucket ID for ALB access logs."
  type        = string
  default     = null
}

# ----------------------------------------------------------------
# COMPUTE VARIABLES — Dependencies
# ----------------------------------------------------------------

variable "ec2_vpc_endpoints_ready" {
  description = "Dependency guard to ensure VPC endpoints exist before compute resources."
  type        = list(string)
}