# -------------------------------------------------------------------
# CONTRACT OUTPUTS
# Values consumed by other modules. Defines the dependency contract.
# -------------------------------------------------------------------

# VPC CIDR - Contract + Operator
output "vpc_cidr" {
  description = "CIDR block of the VPC"
  value       = aws_vpc.main.cidr_block
}

# VPC ID - Contract + Operator
output "vpc_id" {
  description = "VPC ID for downstream modules"
  value       = aws_vpc.main.id
}

# Public Subnet IDs
output "public_subnet_ids" {
  description = "Public subnet IDs"
  value       = aws_subnet.public_app[*].id
}

# Private App Subnet IDs
output "private_app_subnet_ids" {
  description = "Private app subnet IDs"
  value       = aws_subnet.private_app[*].id
}

# Private Data Subnet IDs
output "private_data_subnet_ids" {
  description = "Private data subnet IDs"
  value       = aws_subnet.private_data[*].id
}


# -------------------------------------------------------------------
# OPERATOR OUTPUTS (Observability)
# For human visibility. Not used for modules.
# -------------------------------------------------------------------

# VPC Name
output "vpc_name" {
  description = "Name tag of the VPC"
  value       = aws_vpc.main.tags["Name"]
}