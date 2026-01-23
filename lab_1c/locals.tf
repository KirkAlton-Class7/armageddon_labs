locals {
  # Environment setup
  environment = lower(var.env)
  application = var.application_name

  # Replace this with your own trusted IP.
  # DO NOT use 0.0.0.0/0 in production.
  trusted_ip = "0.0.0.0/0"

  # Optional: You can manually add the AWS Instance Connect region CIDR in the console after deploying.
  # https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-connect-tutorial.html#eic-tut1-task2

  # TODO: Working on automating this in Terraform with an AWS data source and region to CIDR range map.


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

  # Public Subnets
  public_subnets = [
    aws_subnet.public_a.id,
    aws_subnet.public_b.id,
    aws_subnet.public_c.id
  ]

  # Assigns random subnet from the list using shared random index
  random_public_subnet = local.public_subnets[local.subnet_index]

  # Common tags for public subnets
  public_subnet_tags = {
    Exposure = "public"
    Egress   = "igw"
  }

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

  # Private Data Subnets
  private_data_subnets = [
    aws_subnet.private_data_a.id,
    aws_subnet.private_data_b.id,
    aws_subnet.private_data_c.id
  ]

  random_private_data_subnet = local.private_data_subnets[local.subnet_index]

  private_data_subnet_tags = {
    Exposure = "internal-only"
    Egress   = "none"
  }

  # Other Locals
  # Add here
}