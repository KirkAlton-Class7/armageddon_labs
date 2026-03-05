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
output "public_subnets" {
  description = "Public subnet IDs"
  value       = local.public_subnet_ids
}

# Private App Subnet IDs
output "private_app_subnets" {
  description = "Private app subnet IDs"
  value       = local.private_app_subnet_ids
}

# Private Data Subnet IDs
output "private_data_subnets" {
  description = "Private data subnet IDs"
  value       = local.private_data_subnet_ids
}



  # Shared tags for public subnets and resources
output "public_subnet_tags" {
  description = "Tags for public subnets and resources"
  value = local.public_subnet_tags
}

  # Shared tags for private app subnets and resources
output "private_app_subnet_tags" {
  description = "Tags for private app subnets and resources"
  value = local.private_app_subnet_tags
}

  # Shared tags for private subnets and resources
output "private_subnet_tags" {
  description = "Tags for private subnets and resources"
  value = local.private_data_subnet_tags
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


# ----------------------------------------------------------------
# DEMONSTRATION OUTPUTS (Not used in deployment)
# ----------------------------------------------------------------

# Demo Owner
output "demo_owner_normalized" {
  description = "DEMO: Transformed module value returned to root."
  value       = local.demo_owner
}









output "public_subnet_ids" {
  value = local.public_subnet_ids
}

output "private_app_subnet_ids" {
  value = local.private_app_subnet_ids
}

output "private_data_subnet_ids" {
  value = local.private_data_subnet_ids
}


output "ec2_vpc_endpoints_ready" {
  value = [
    aws_vpc_endpoint.s3.id,
    aws_vpc_endpoint.ssm.id,
    aws_vpc_endpoint.ssm_messages.id,
    aws_vpc_endpoint.ec2_messages.id,
    aws_vpc_endpoint.secretsmanager.id,
    aws_vpc_endpoint.logs.id
  ]
}


# variable "endpoints_ready" {
#   description = "Ensures VPC endpoints exist before compute launches"
#   type        = list(string)
# }

#ec2_vpc_endpoints_ready        = module.network.ec2_vpc_endpoints_ready