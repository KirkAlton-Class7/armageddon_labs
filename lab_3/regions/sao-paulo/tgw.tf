resource "aws_ec2_transit_gateway" "saopaulo" {
  description = "${local.name_prefix}-saopaulo-spoke-tgw"

  auto_accept_shared_attachments  = "disable"
  default_route_table_association = "disable"
  default_route_table_propagation = "disable"

  tags = merge(
    {
      Name      = "${local.name_prefix}-saopaulo-spoke-tgw"
      Component = "network"
      Role      = "spoke"
    },
    local.context.tags
  )
}