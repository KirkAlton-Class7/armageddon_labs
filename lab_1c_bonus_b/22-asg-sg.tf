# Private ASG Security Group
resource "aws_security_group" "rds_app_asg" {
  name        = "rds-app-asg-sg"
  description = "Only allow inbound traffic from public-application-lb-sg"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name = "private-asg-sg"
  }
}

# SG Rule: Allow HTTP Inbound only from Public ALB SG
resource "aws_vpc_security_group_ingress_rule" "allow_inbound_http_from_public_alb_sg" {
  security_group_id            = aws_security_group.rds_app_asg.id
  ip_protocol                  = "tcp"
  to_port                      = 80
  from_port                    = 80
  referenced_security_group_id = aws_security_group.public_alb.id
}

# SG Rule: Allow HTTPS Inbound only from Public ALB SG
resource "aws_vpc_security_group_ingress_rule" "allow_inbound_https_from_public_alb_sg" {
  security_group_id            = aws_security_group.rds_app_asg.id
  ip_protocol                  = "tcp"
  to_port                      = 443
  from_port                    = 443
  referenced_security_group_id = aws_security_group.public_alb.id
}

# SG Rule: Allow HTTP Outbound to Public ALB Subnets
resource "aws_vpc_security_group_egress_rule" "allow_outbound_http_to_public_subnets" {
  for_each = toset(local.public_subnet_cidrs) # Converts tuple of CIDR strings into a set of strings

  security_group_id = aws_security_group.rds_app_asg.id
  cidr_ipv4         = each.value
  ip_protocol       = "tcp"
  to_port           = 80
  from_port         = 80
}

# SG Rule: Allow HTTPS Outbound to Public ALB Subnets
resource "aws_vpc_security_group_egress_rule" "allow_outbound_https_to_public_subnets" {
  for_each = toset(local.public_subnet_cidrs)

  security_group_id = aws_security_group.rds_app_asg.id
  cidr_ipv4         = each.value # Each value is a CIDR string from the set
  ip_protocol       = "tcp"
  to_port           = 443
  from_port         = 443
}