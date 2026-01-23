# Public Route Table (NAT Only)
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name      = "public-route-table"
    Component = "network"
  }

}


# Public Route Table Associations
resource "aws_route_table_association" "public_a" {
  subnet_id      = aws_subnet.nat_subnet.id
  route_table_id = aws_route_table.public.id
}

# Private Egress Route Table
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.main.id
  }

  tags = {
    Name      = "private-egress-route-table"
    Component = "network"
  }

}

# Private Egress Route Table Associations
resource "aws_route_table_association" "private_egress_a" {
  subnet_id      = aws_subnet.private_egress_a.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private_egress_b" {
  subnet_id      = aws_subnet.private_egress_b.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private_egress_c" {
  subnet_id      = aws_subnet.private_egress_c.id
  route_table_id = aws_route_table.private.id
}

# Local Route Table
resource "aws_route_table" "local" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "10.10.0.0/16"
    gateway_id = "local"
  }

  tags = {
    Name      = "local-route-table"
    Component = "network"
  }

}


# Local Route Table Associations
# Private App Subnets
resource "aws_route_table_association" "private_app_a" {
  subnet_id      = aws_subnet.private_app_a.id
  route_table_id = aws_route_table.local.id
}

resource "aws_route_table_association" "private_app_b" {
  subnet_id      = aws_subnet.private_app_b.id
  route_table_id = aws_route_table.local.id
}

resource "aws_route_table_association" "private_app_c" {
  subnet_id      = aws_subnet.private_app_c.id
  route_table_id = aws_route_table.local.id
}

# Private Data Subnets
resource "aws_route_table_association" "private_data_a" {
  subnet_id      = aws_subnet.private_data_a.id
  route_table_id = aws_route_table.local.id
}

resource "aws_route_table_association" "private_data_b" {
  subnet_id      = aws_subnet.private_data_b.id
  route_table_id = aws_route_table.local.id
}

resource "aws_route_table_association" "private_data_c" {
  subnet_id      = aws_subnet.private_data_c.id
  route_table_id = aws_route_table.local.id
}