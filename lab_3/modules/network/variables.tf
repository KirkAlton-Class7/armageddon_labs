# ----------------------------------------------------------------
# NETWORKING VARIABLES — Core Inputs
# ----------------------------------------------------------------

variable "azs" {
  description = "Availability zones for subnet deployment."
  type        = list(string)
}

variable "account_id" {
  description = "AWS account ID."
  type        = string
}

variable "context" {
  description = "Deployment context containing region, application name, environment, and common tags."
  type = object({
    region = string
    app    = string
    env    = string
    tags   = map(string)
  })
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC."
  type        = string
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
# NETWORKING VARIABLES — Demonstration
# ----------------------------------------------------------------
# DEMO: Not used in deployment.

variable "demo_owner" {
  description = "Demo owner identifier from the root module."
  type        = string
}