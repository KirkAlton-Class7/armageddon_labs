# ----------------------------------------------------------------
# NETWORKING — Internet Gateway
# ----------------------------------------------------------------

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = merge(local.tags, local.public_subnet_tags, {
    Name      = "main-igw"
    Component = "network"
  })
}