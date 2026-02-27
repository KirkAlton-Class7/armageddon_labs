# ----------------------------------------------------------------
# INPUT VARIABLES — Networking
# ----------------------------------------------------------------

# Input Account ID
variable "account_id" {
  type        = string
  description = "AWS Account ID"
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


# Input VPC CIDR Block
variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC"
}


# Name Prefix
variable "name_prefix" {
  type = string
}

# Name Suffix
variable "name_suffix" {
  type = string
}

# # Bucket Suffix
# variable "bucket_suffix" {
#   type = string
# }

# ----------------------------------------------------------------
# INPUT VARIABLES — Demonstration (not used in deployment)
# ----------------------------------------------------------------

# Demo Owner
variable "demo_owner" { # Module variable
  type        = string
  description = "Demonstration variable received from root module"
}