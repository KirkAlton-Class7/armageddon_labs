locals{
    
  # CIDR
  vpc_cidr = var.vpc_cidr
  
  # Environment
  app  = var.context.app
  env  = var.context.env
  tags = var.context.tags
  region = var.context.region
  
  # Accessibility Zones
  azs    = data.aws_availability_zones.available.names
  
  # -------------------------------------------------------------------
  # Subnet selection helpers
  # -------------------------------------------------------------------
  subnet_index = random_integer.subnet_picker.result

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

  # Assigns random public subnet using shared random index
  random_public_subnet = local.public_subnets[local.subnet_index]

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

  # Assigns random private app subnet using shared random index
  random_private_app_subnet = local.private_app_subnets[local.subnet_index]

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

  # Assigns random private data subnet using shared random index
  random_private_data_subnet = local.private_data_subnets[local.subnet_index]

  # -------------------------------------------------------------------
  # Shared Network Tags
  # -------------------------------------------------------------------
  # Shared tags for public subnets
  public_subnet_tags = {
    Exposure = "public"
    Egress   = "igw"
  }

  # Shared tags for private subnets
  private_subnet_tags = {
    Exposure  = "internal-only"
    Egress    = "none"
    Component = "network"
  }

  # Shared tags for vpc endpoints
  vpc_endpoint_tags = {
    Exposure  = "egress-only"
    Egress    = "vpc-endpoint"
    Component = "network"
  }
}