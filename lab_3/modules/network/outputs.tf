# ----------------------------------------------------------------
# NETWORKING OUTPUTS — VPC Resources
# ----------------------------------------------------------------

output "vpc_cidr" {
  description = "CIDR block of the VPC."
  value       = aws_vpc.main.cidr_block
}

output "vpc_id" {
  description = "VPC ID."
  value       = aws_vpc.main.id
}

output "public_subnets" {
  description = "Public subnet IDs."
  value       = local.public_subnet_ids
}

# output "private_app_subnets" {
#   description = "Private application subnet IDs."
#   value       = local.private_app_subnet_ids
# }

output "private_data_subnets" {
  description = "Private data subnet IDs."
  value       = local.private_data_subnet_ids
}

output "public_subnet_tags" {
  description = "Tags applied to public subnet resources."
  value       = local.public_subnet_tags
}

output "private_app_subnet_tags" {
  description = "Tags applied to private application subnet resources."
  value       = local.private_app_subnet_tags
}

output "private_subnet_tags" {
  description = "Tags applied to private data subnet resources."
  value       = local.private_data_subnet_tags
}

# ----------------------------------------------------------------
# NETWORKING OUTPUTS — Operator / Observability
# ----------------------------------------------------------------

output "vpc_name" {
  description = "Name tag of the VPC."
  value       = aws_vpc.main.tags["Name"]
}

# ----------------------------------------------------------------
# NETWORKING OUTPUTS — Demonstration
# ----------------------------------------------------------------

output "demo_owner_normalized" {
  description = "Transformed demo owner value returned to the root module."
  value       = local.demo_owner
}

# ----------------------------------------------------------------
# NETWORKING OUTPUTS — Subnet References
# ----------------------------------------------------------------

output "public_subnet_ids" {
  description = "Public subnet IDs."
  value       = local.public_subnet_ids
}

output "private_app_subnet_ids" {
  description = "Private application subnet IDs."
  value       = local.private_app_subnet_ids
}

output "private_data_subnet_ids" {
  description = "Private data subnet IDs."
  value       = local.private_data_subnet_ids
}

# ----------------------------------------------------------------
# NETWORKING OUTPUTS — Endpoint Readiness
# ----------------------------------------------------------------

output "ec2_vpc_endpoints_ready" {
  description = "VPC endpoint IDs used as dependency guard for compute resources."
  value = [
    aws_vpc_endpoint.s3.id,
    aws_vpc_endpoint.ssm.id,
    aws_vpc_endpoint.ssm_messages.id,
    aws_vpc_endpoint.ec2_messages.id,
    aws_vpc_endpoint.secretsmanager.id,
    aws_vpc_endpoint.logs.id
  ]
}