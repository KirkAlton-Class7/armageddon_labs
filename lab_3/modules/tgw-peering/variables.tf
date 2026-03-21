# ----------------------------------------------------------------
# TGW PEERING VARIABLES
# ----------------------------------------------------------------

# ----------------------------------------------------------------
# TGW VARIABLES — Naming
# ----------------------------------------------------------------

variable "peering_name" {
  description = "Logical name for the TGW peering relationship."
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
# TGW VARIABLES — Deployment Context
# ----------------------------------------------------------------

variable "context" {
  description = "Deployment context containing region, application name, environment, and common tags."
  type = object({
    region = string
    app    = string
    env    = string
    tags   = map(string)
  })
}

# ----------------------------------------------------------------
# TGW PEERING VARIABLES — Core Configuration
# ----------------------------------------------------------------

variable "source_tgw_id" {
  description = "Transit Gateway ID in source region."
  type        = string
}

variable "peer_tgw_id" {
  description = "Transit Gateway ID in peer region."
  type        = string
}

variable "peer_region" {
  description = "Peer AWS region."
  type        = string
}


# ----------------------------------------------------------------
# TGW PEERING VARIABLES — Route Tables
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
# TGW PEERING VARIABLES — CIDR Routing
# ----------------------------------------------------------------

variable "source_vpc_cidr" {
  description = "CIDR block of the source VPC."
  type        = string
}

variable "peer_vpc_cidr" {
  description = "CIDR block of the peer VPC."
  type        = string
}