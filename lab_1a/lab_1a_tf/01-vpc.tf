resource "aws_vpc" "main" {
  cidr_block           = "10.10.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "quick-vpc-${local.region}" #${local.application}
    Component = "network"
  }
}

data "aws_availability_zones" "available" {
  state = "available"
}