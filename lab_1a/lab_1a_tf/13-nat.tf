# Elastic IP Configuration
resource "aws_eip" "main" {
  domain = "vpc"
}

# NAT Configuration
resource "aws_nat_gateway" "main" {
  allocation_id = aws_eip.main.id
  subnet_id     = local.random_public_subnet

  tags = {
    Name      = "main-nat-gw"
    Component = "network"
  }
  depends_on = [aws_internet_gateway.main]
}