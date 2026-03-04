# ----------------------------------------------------------------
# NETWORKING — Internet Gateway
# ----------------------------------------------------------------

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = merge(
    {
    Name      = "main-igw"
    Component = "network"
  },
    var.context.tags, local.public_subnet_tags
  )
}