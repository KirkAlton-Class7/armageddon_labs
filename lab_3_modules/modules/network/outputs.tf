# -------------------------------------------------------------------
# CONTRACT OUTPUTS (Module API)
# Values exposed for consumption by other modules
# -------------------------------------------------------------------

output "vpc_id" {
  description = "VPC ID for downstream modules"
  value       = aws_vpc.main.id
}

output "private_subnet_ids" {
  description = "Private subnet IDs for compute/database modules"
  value       = aws_subnet.private[*].id
}

# -------------------------------------------------------------------
# OPERATOR OUTPUTS (Human / CLI Visibility)
# Useful for debugging, inspection, or CI/CD consumption
# -------------------------------------------------------------------

output "vpc_cidr" {
  description = "CIDR block of the VPC"
  value       = aws_vpc.main.cidr_block
}

output "vpc_name" {
  description = "Name tag of the VPC"
  value       = aws_vpc.main.tags["Name"]
}





output "vpc_id" {
  value = aws_vpc.main.id
}

output "vpc_cidr" {
  value = aws_vpc.main.cidr_block
}

output "public_subnet_ids" {
  value = [
    aws_subnet.public_a.id,
    aws_subnet.public_b.id,
    aws_subnet.public_c.id
  ]
}

output "private_app_subnet_ids" {
  value = [
    aws_subnet.private_app_a.id,
    aws_subnet.private_app_b.id,
    aws_subnet.private_app_c.id
  ]
}