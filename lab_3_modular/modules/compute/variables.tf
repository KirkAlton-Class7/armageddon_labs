# ----------------------------------------------------------------
# COMPUTE — Input Variables (Application Context)
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
# COMPUTE — Input Variables (Networking)
# ----------------------------------------------------------------

variable "vpc_id" {
  type        = string
  description = "VPC ID"
}

variable "public_subnet_ids" {
  description = "Public subnet IDs"
  type        = list(string)
}

variable "private_app_subnet_ids" {
  description = "Private app subnet IDs"
  type        = list(string)
}

variable "public_subnet_tags" {
  type        = map(string)
  description = "Tags for public subnets and resources"
}

variable "private_app_subnet_tags" {
  type        = map(string)
  description = "Tags for private app subnets and resources"
}

# ----------------------------------------------------------------
# COMPUTE — Input Variables (Security)
# ----------------------------------------------------------------

variable "edge_auth_header_name" {
  type        = string
  description = "Edge authentication header name."
}

variable "edge_auth_value" {
  description = "Edge authentication token used as a header value between edge and origin"
  type        = string
  sensitive   = true
}

# ----------------------------------------------------------------
# COMPUTE — Input Variables (IAM)
# ----------------------------------------------------------------

variable "iam_role_rds_app_name" {
  type        = string
  description = "RDS App IAM Role Name"
}

variable "rds_app_instance_profile_name" {
  type        = string
  description = "RDS App Instance Profile Name"
}

# ----------------------------------------------------------------
# COMPUTE — Input Variables (Security Groups)
# ----------------------------------------------------------------

variable "rds_app_asg_sg_id" {
  type        = string
  description = "RDS App ASG Security Group ID"
}

variable "alb_origin_sg_id" {
  type        = string
  description = "ALB Origin Security Group ID"
}

# ----------------------------------------------------------------
# COMPUTE — Input Variables (Certificates)
# ----------------------------------------------------------------

variable "rds_app_cert_arn" {
  description = "ARN of ACM certificate for the ALB HTTPS listener"
  type        = string
}

# ----------------------------------------------------------------
# COMPUTE — Input Variables (Secrets)
# ----------------------------------------------------------------

variable "db_secret_arn" {
  type        = string
  description = "ARN of database credentials secret"
}

# ----------------------------------------------------------------
# COMPUTE — Input Variables (ALB Logging)
# ----------------------------------------------------------------

variable "alb_log_s3" {
  type        = bool
  description = "If true, enable ALB access logging to S3."
}

variable "alb_access_logs_prefix" {
  type        = string
  description = "S3 prefix for ALB access logs (NO leading or trailing slash)"
}

variable "alb_logs_bucket_id" {
  description = "ID of ALB logs S3 bucket (null if disabled)"
  type        = string
  default     = null
}

# ----------------------------------------------------------------
# COMPUTE — Input Variables (Dependencies)
# ----------------------------------------------------------------

variable "ec2_vpc_endpoints_ready" {
  description = "Ensures VPC endpoints exist before compute launches"
  type        = list(string)
}