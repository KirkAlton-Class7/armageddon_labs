# ----------------------------------------------------------------
# TGW CONNECTION VARIABLES
# ----------------------------------------------------------------

# ----------------------------------------------------------------
# TGW CONNECTION VARIABLES — Application Identity
# ----------------------------------------------------------------

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
# TGW CONNECTION VARIABLES — Topology
# ----------------------------------------------------------------

variable "source_region" {
  description = "Source AWS region (e.g., ap-northeast-1)."
  type        = string
}

variable "peer_region" {
  description = "Peer AWS region (e.g., sa-east-1)."
  type        = string
}

# ----------------------------------------------------------------
# TGW CONNECTION VARIABLES — Core Configuration
# ----------------------------------------------------------------

variable "source_tgw_id" {
  description = "Transit Gateway ID in source region."
  type        = string
}

variable "peer_tgw_id" {
  description = "Transit Gateway ID in peer region."
  type        = string
}

# ----------------------------------------------------------------
# TGW CONNECTION VARIABLES — Route Tables
# ----------------------------------------------------------------

variable "source_route_table_id" {
  description = "Source Transit Gateway route table ID."
  type        = string
}

variable "peer_route_table_id" {
  description = "Peer Transit Gateway route table ID."
  type        = string
}

# ----------------------------------------------------------------
# TGW CONNECTION VARIABLES — CIDR Routing
# ----------------------------------------------------------------

variable "source_vpc_cidr" {
  description = "CIDR block of the source VPC."
  type        = string
}

variable "peer_vpc_cidr" {
  description = "CIDR block of the peer VPC."
  type        = string
}