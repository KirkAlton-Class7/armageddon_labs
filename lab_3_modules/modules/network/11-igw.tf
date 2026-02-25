# ----------------------------------------------------------------
# NETWORKING — Internet Gateway
# ----------------------------------------------------------------

resource "aws_internet_gateway" "main" {
  vpc_id = module.network.vpc_id

  tags = merge(local.tags, local.public_subnet_tags, {
    Name      = "main-igw"
    Component = "network"
  })
}