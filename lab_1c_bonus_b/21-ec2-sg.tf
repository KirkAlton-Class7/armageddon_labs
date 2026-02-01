# # EC2 Public App Security Group
# resource "aws_security_group" "ec2_rds_app" {
#   name        = "ec2-rds-app-sg"
#   description = "Allow all internal inbound traffic for HTTP and SSH"
#   vpc_id      = aws_vpc.main.id

#   tags = {
#     Name      = "ec2-rds-app-sg"
#     Component = "security"
#   }
# }

# # SG Rule: Allow Internal HTTP Inbound for EC2 RDS App SG
# resource "aws_vpc_security_group_ingress_rule" "allow_all_internal_ipv4_ec2_rds_app" {
#   security_group_id = aws_security_group.ec2_rds_app.id
#   cidr_ipv4         = local.vpc_cidr
#   ip_protocol       = "tcp"
#   from_port         = 80
#   to_port           = 80
# }

# # SG Rule: Allow all Outbound IPv4 for EC2 RDS App SG
# resource "aws_vpc_security_group_egress_rule" "allow_all_internal_outbound_ipv4_ec2_rds_app" {
#   security_group_id = aws_security_group.ec2_rds_app.id
#   cidr_ipv4         = "0.0.0.0/0"
#   ip_protocol       = "-1" # semantically equivalent to all ports
# }