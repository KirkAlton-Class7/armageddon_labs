# ----------------------------------------------------------------
# OUTPUTS — Networking
# ----------------------------------------------------------------

output "availability_zones" {
  description = "Avialability Zones"
  value       = data.aws_availability_zones.available.names
}

output "vpc_info" {
  description = "VPC ID, Name and CIDR block"
  value = {
    id   = module.network.vpc_id
    name = aws_vpc.main.tags["Name"]
    cidr = aws_vpc.main.cidr_block
  }
}