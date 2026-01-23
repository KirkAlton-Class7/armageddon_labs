locals {
  # Environment setup
  environment = lower(var.env)
  application = var.application_name
  trusted_ip  = var.trusted_ip

  # Region and AZ
  region = var.region_map[var.region_choice]
  azs    = data.aws_availability_zones.available.names

  # Base Tags
  base_tags = {
    Environment = "${local.environment}"
  }

  # Naming helpers
  name_prefix = "${local.application}-${local.environment}"
  name_suffix = lower(random_string.suffix.result)

  # Subnet selection helpers
  subnet_index = random_integer.subnet_picker.result

  # Private Egress Subnets
  private_egress_subnets = [
    aws_subnet.private_egress_a.id,
    aws_subnet.private_egress_b.id,
    aws_subnet.private_egress_c.id
  ]

  random_private_egress_subnet = local.private_egress_subnets[local.subnet_index]

  private_egress_subnet_tags = {
    Exposure = "egress-only"
    Egress   = "nat"
  }


  # Private App Subnets
  private_app_subnets = [
    aws_subnet.private_app_a.id,
    aws_subnet.private_app_b.id,
    aws_subnet.private_app_c.id
  ]

  # Assigns random subnet from the list using shared random index
  random_private_app_subnet = local.private_app_subnets[local.subnet_index]


  # Private Data Subnets
  private_data_subnets = [
    aws_subnet.private_data_a.id,
    aws_subnet.private_data_b.id,
    aws_subnet.private_data_c.id
  ]

  random_private_data_subnet = local.private_data_subnets[local.subnet_index]

  private_subnet_tags = {
    Exposure = "internal-only"
    Egress   = "none"
  }

  # Other Locals
  # Add here
}