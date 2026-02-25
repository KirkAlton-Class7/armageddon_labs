# ----------------------------------------------------------------
# VPC ENDPOINTS — Key Management
# ----------------------------------------------------------------

# Interface Endpoint - KMS
resource "aws_vpc_endpoint" "kms" {
  vpc_id            = aws_vpc.main.id
  service_name      = "com.amazonaws.${local.region}.kms"
  vpc_endpoint_type = "Interface"
  subnet_ids        = local.private_app_subnets

  security_group_ids = [
    aws_security_group.vpc_endpoints.id
  ]

  private_dns_enabled = true

  tags = merge(local.tags, local.private_subnet_tags,
    {
      Name = "vpc-endpoint-kms"
    }
  )
}
# ----------------------------------------------------------------
# VPC ENDPOINTS — Storage
# ----------------------------------------------------------------

# S3 Gateway Endpoint
resource "aws_vpc_endpoint" "s3" {
  vpc_id       = aws_vpc.main.id
  service_name = "com.amazonaws.${local.region}.s3"

  tags = merge(local.tags, local.private_subnet_tags,
    {
      Name = "vpc-endpoint-s3"

    }
  )
}

# ----------------------------------------------------------------
# VPC ENDPOINTS — Secrets & Configuration
# ----------------------------------------------------------------

# Interface Endpoint - Secrets Manager
resource "aws_vpc_endpoint" "secretsmanager" {
  vpc_id            = aws_vpc.main.id
  service_name      = "com.amazonaws.${local.region}.secretsmanager"
  vpc_endpoint_type = "Interface"

  subnet_ids = local.private_app_subnets

  security_group_ids = [
    aws_security_group.vpc_endpoints.id
  ]

  private_dns_enabled = true

  tags = merge(local.tags,     local.private_subnet_tags,
    {
      Name = "vpc-endpoint-secretsmanager"

    }  )
}

# ----------------------------------------------------------------
# VPC ENDPOINTS — Systems Manager (ssm)
# ----------------------------------------------------------------

# Interface Endpoint - Systems Manager
resource "aws_vpc_endpoint" "ssm" {
  vpc_id            = aws_vpc.main.id
  service_name      = "com.amazonaws.${local.region}.ssm"
  vpc_endpoint_type = "Interface"

  subnet_ids = local.private_app_subnets

  security_group_ids = [
    aws_security_group.vpc_endpoints.id
  ]

  private_dns_enabled = true

  tags = merge(local.tags,     local.private_subnet_tags,
    {
      Name = "vpc-endpoint-ssm"

    }  )
}

# Interface Endpoint - Systems Manager Messages
resource "aws_vpc_endpoint" "ssm_messages" {
  vpc_id            = aws_vpc.main.id
  service_name      = "com.amazonaws.${local.region}.ssmmessages"
  vpc_endpoint_type = "Interface"

  subnet_ids = local.private_app_subnets

  security_group_ids = [
    aws_security_group.vpc_endpoints.id
  ]

  private_dns_enabled = true

  tags = merge(local.tags,     local.private_subnet_tags,
    {
      Name = "vpc-endpoint-ssm-messages"
    }  )
}

# Interface Endpoint - Systems Manager EC2 Messages
resource "aws_vpc_endpoint" "ec2_messages" {
  vpc_id            = aws_vpc.main.id
  service_name      = "com.amazonaws.${local.region}.ec2messages"
  vpc_endpoint_type = "Interface"

  subnet_ids = local.private_app_subnets

  security_group_ids = [
    aws_security_group.vpc_endpoints.id
  ]

  private_dns_enabled = true

  tags = merge(local.tags,     local.private_subnet_tags,
    {
      Name = "vpc-endpoint-ec2-messages"

    }  )
}
# ----------------------------------------------------------------
# VPC ENDPOINTS — Compute
# ----------------------------------------------------------------

# Interface Endpoint - EC2
resource "aws_vpc_endpoint" "ec2" {
  vpc_id            = aws_vpc.main.id
  service_name      = "com.amazonaws.${local.region}.ec2"
  vpc_endpoint_type = "Interface"

  subnet_ids = local.private_app_subnets

  security_group_ids = [
    aws_security_group.vpc_endpoints.id
  ]

  private_dns_enabled = true

  tags = merge(local.tags, local.private_subnet_tags,
    {
      Name = "vpc-endpoint-ec2"

    }  )
}

# ----------------------------------------------------------------
# VPC ENDPOINTS — Monitoring & Logging
# ----------------------------------------------------------------

# Interface Endpoint - CloudWatch Monitoring
resource "aws_vpc_endpoint" "monitoring" {
  vpc_id            = aws_vpc.main.id
  service_name      = "com.amazonaws.${local.region}.monitoring"
  vpc_endpoint_type = "Interface"

  subnet_ids = local.private_app_subnets

  security_group_ids = [
    aws_security_group.vpc_endpoints.id
  ]

  private_dns_enabled = true

  tags = merge(local.tags, local.private_subnet_tags,
    {
      Name = "vpc-endpoint-monitoring"

    }  )
}

# Interface Endpoint - CloudWatch Logs
resource "aws_vpc_endpoint" "logs" {
  vpc_id            = aws_vpc.main.id
  service_name      = "com.amazonaws.${local.region}.logs"
  vpc_endpoint_type = "Interface"

  subnet_ids = local.private_app_subnets

  security_group_ids = [
    aws_security_group.vpc_endpoints.id
  ]

  private_dns_enabled = true

  tags = merge(local.tags, local.private_subnet_tags,
    {
      Name = "vpc-endpoint-logs"

    }  )
}