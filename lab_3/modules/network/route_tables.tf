# ----------------------------------------------------------------
# NETWORKING — Route Tables (Public)
# ----------------------------------------------------------------

# Public Route Table
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = merge(
    {
      Name      = "public-route-table"
      Component = "network"
    },
    var.context.tags
  )
}

# ----------------------------------------------------------------
# NETWORKING — Route Tables (Private / Local)
# ----------------------------------------------------------------

# Local Route Table
resource "aws_route_table" "local" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = var.vpc_cidr
    gateway_id = "local"
  }

  tags = merge(
    {
      Name      = "local-route-table"
      Component = "network"
    },
    var.context.tags
  )
}