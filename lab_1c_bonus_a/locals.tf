locals {
  # Account ID
  account_id = data.aws_caller_identity.current_account.account_id

  # VPC CIDR
  vpc_cidr = var.vpc_cidr

  # Environment setup
  environment = lower(var.env)
  application = var.application_name

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

  # Shared tags for vpc endpoints
  vpc_endpoint_tags = {
    Exposure  = "egress-only"
    Egress    = "vpc-endpoint"
    Component = "network"
  }


  # Private App Subnets
  private_app_subnets = [
    aws_subnet.private_app_a.id,
    aws_subnet.private_app_b.id,
    aws_subnet.private_app_c.id
  ]

  # Assigns random private app subnet from the list using shared random index
  random_private_app_subnet = local.private_app_subnets[local.subnet_index]


  # Private Data Subnets
  private_data_subnets = [
    aws_subnet.private_data_a.id,
    aws_subnet.private_data_b.id,
    aws_subnet.private_data_c.id
  ]

  # Assigns random private data subnet from the list using shared random index
  random_private_data_subnet = local.private_data_subnets[local.subnet_index]

  # Sharded tags for private subnets
  private_subnet_tags = {
    Exposure  = "internal-only"
    Egress    = "none"
    Component = "network"
  }

  # Template - EC2 User Data
  ec2_user_data = templatefile("${path.module}/templates/1a_user_data.sh.tpl",
    {
      region      = local.region,
      secret_id   = local.secret_id
      name_suffix = local.name_suffix
    }
  )

  # Template - CloudWatch Agent Configuration File
  cloudwatch_agent_config = templatefile("${path.module}/templates/cloudwatch-agent-config.json.tpl",
    {
      name_suffix = local.name_suffix
    }
  )


  # Other Locals
  ec2_sg_id = aws_security_group.ec2_rds_app.id

  private_db_sg_id = aws_security_group.private_db.id

  db_credentials = {
    username = "admin"
    password = random_password.db_password.result
  }

  secret_id = aws_secretsmanager_secret.lab_rds_mysql.arn

}