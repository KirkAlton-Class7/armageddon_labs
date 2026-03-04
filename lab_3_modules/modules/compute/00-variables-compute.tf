# ----------------------------------------------------------------
# INPUT VARIABLES — ALB Logging
# ----------------------------------------------------------------



# Toggle ALB Access Logs (S3)
variable "alb_log_s3" {
  type        = bool
  description = "If true, enable ALB access logging to S3."
}


# Input ALB Access Logs Prefix
variable "alb_access_logs_prefix" {
  type        = string
  description = "S3 prefix for ALB access logs (NO leading or trailing slash)"
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



variable "db_secret_arn" {
  type        = string
  description = "ARN of database credentials secret"
}

variable "rds_app_iam_role" {
  type        = string
  description = "ARN of RDS App IAM role"
}



# VPC ID
variable "vpc_id" {
  type        = string
  description = "VPC ID"
}

variable "public_subnet_ids" {
  description = "Public subnet IDs"
  type = list(string)
}

variable "private_app_subnet_ids" {
  description = "Private app subnet IDs"
  type = list(string)
}


variable "public_subnet_tags" {
  type = map(string)
  description = "Tags for public subnets and resources"
}

variable "private_app_subnet_tags" {
  type = map(string)
  description = "Tags for private app subnets and resources"
}


# Edge Authentication Header
variable "edge_auth_header_name" {
  type        = string
  description = "Edge authentication header name."
}


# RDS App IAM Role Name
variable "iam_role_rds_app_name" {
  type        = string
  description = "RDS App IAM Role Name"
}


variable "rds_app_instance_profile_name" {
  type        = string
  description = "RDS App Instance Profile Name"
}



variable "rds_app_asg_sg_id" {
  type = string
  description = "RDS App ASG Security Group ID"
}




variable "alb_origin_sg_id" {
  type = string
  description = "ALB Origin Security Group ID"
}


variable "alb_logs_bucket_id" {
  description = "ID of ALB logs S3 bucket (null if disabled)"
  type        = string
  default     = null
}





variable "rds_app_cert_arn" {
  description = "ARN of ACM certificate for the ALB HTTPS listener"
  type        = string
}




variable "ec2_vpc_endpoints_ready" {
  description = "Ensures VPC endpoints exist before compute launches"
  type        = list(string)
}





# ----------------------------------------------------------------
# VARIABLE — Edge Auth Token (Header Value)
# ----------------------------------------------------------------
variable "edge_auth_value" {
  description = "Edge authentication token used as a header value between edge and origin"
  type        = string
  sensitive   = true
}