# ----------------------------------------------------------------
# NETWORKING — VPC
# ----------------------------------------------------------------

resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  instance_tenancy     = "default"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = merge(var.context.tags, {
    Name      = "vpc-${var.context.app}-${var.context.env}"
    Component = "network"
  })
}

# ----------------------------------------------------------------
# NETWORKING — Availability Zones
# ----------------------------------------------------------------
data "aws_availability_zones" "available" {
  state = "available"
}