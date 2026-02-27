locals {

  # Accessibility Zones

  # Network
  # -------------------------------------------------------------------
  # Public Subnets
  # -------------------------------------------------------------------
  public_subnets = [
    aws_subnet.public_a.id,
    aws_subnet.public_b.id,
    aws_subnet.public_c.id
  ]

  # Public Subnet CIDRs
  public_subnet_cidrs = [
    aws_subnet.public_a.cidr_block,
    aws_subnet.public_b.cidr_block,
    aws_subnet.public_c.cidr_block
  ]

  # -------------------------------------------------------------------
  # Private Application Subnets
  # -------------------------------------------------------------------
  private_app_subnets = [
    aws_subnet.private_app_a.id,
    aws_subnet.private_app_b.id,
    aws_subnet.private_app_c.id
  ]

  # Private App Subnet CIDRs
  private_app_subnet_cidrs = [
    aws_subnet.private_app_a.cidr_block,
    aws_subnet.private_app_b.cidr_block,
    aws_subnet.private_app_c.cidr_block
  ]

  # -------------------------------------------------------------------
  # Private Data Subnets
  # -------------------------------------------------------------------
  private_data_subnets = [
    aws_subnet.private_data_a.id,
    aws_subnet.private_data_b.id,
    aws_subnet.private_data_c.id
  ]

  # Private Data Subnet CIDRs
  private_data_subnet_cidrs = [
    aws_subnet.private_data_a.cidr_block,
    aws_subnet.private_data_b.cidr_block,
    aws_subnet.private_data_c.cidr_block
  ]

  # -------------------------------------------------------------------
  # Shared Network Tags
  # -------------------------------------------------------------------
  # Shared tags for public subnets and resources
  public_subnet_tags = {
    Exposure = "public"
    Egress   = "igw"
  }

  # Shared tags for public subnets
  private_app_subnet_tags = {
    Exposure = "private"
    Egress   = "nat"
  }

  # Shared tags for private subnets and resources
  private_subnet_tags = {
    Exposure  = "internal-only"
    Egress    = "none"
  }

  # Shared tags for vpc endpoints
  vpc_endpoint_tags = {
    Exposure  = "egress-only"
    Egress    = "vpc-endpoint"
    Component = "network"
  }
}


# ----------------------------------------------------------------
# DEMONSTRATION LOCALS (Not used in deployment)
# ----------------------------------------------------------------

locals {

  # Demo Owner
  demo_owner = lower(var.demo_owner) # Normalization (formatting)

  # Module local derived from module input with transformation.
  # Prefer module-level transformations; use root only when normalization defines deployment identity.
}