# ----------------------------------------------------------------
# TGW VARIABLES — Application Identity
# ----------------------------------------------------------------

variable "name_prefix" {
  description = "Prefix for resource names."
  type        = string
}

variable "name_suffix" {
  description = "Suffix for resource names."
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

variable "tgw_role" {
  description = "Transit Gateway role in topology (e.g., hub, spoke)."
  type        = string
}

# ----------------------------------------------------------------
# TGW VARIABLES — Networking
# ----------------------------------------------------------------

variable "vpc_id" {
  description = "VPC ID for compute resources."
  type        = string
}

variable "private_app_subnet_ids" {
  description = "Private subnet IDs for application compute resources."
  type        = list(string)
}

# Use only if EC2 are in fully private subnet and need cross-region connectivity.
# variable "private_data_subnet_ids" {
#   description = "Private data subnet IDs."
#   type        = list(string)
# }


# ----------------------------------------------------------------
# TGW VARIABLES — Tagging
# ----------------------------------------------------------------

variable "tgw_tags" {
  description = "Map of tags."
  type        = map(string)
  default     = {}
}