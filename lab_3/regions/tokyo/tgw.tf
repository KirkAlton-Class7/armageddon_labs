resource "aws_ec2_transit_gateway" "tokyo" {
  description = "${local.name_prefix}-tokyo-hub-tgw"

  auto_accept_shared_attachments  = "disable"
  default_route_table_association = "disable"
  default_route_table_propagation = "disable"

  tags = merge(
    {
      Name      = "${local.name_prefix}-tokyo-hub-tgw"
      Component = "network"
      Role      = "hub"
    },
    local.context.tags
  )
}

resource "aws_ec2_transit_gateway_vpc_attachment" "tokyo" {
  transit_gateway_id = aws_ec2_transit_gateway.tokyo.id

  vpc_id     = module.network_tokyo.vpc_id
  subnet_ids = module.network_tokyo.private_app_subnet_ids

  tags = merge(
    {
      Name      = "${local.name_prefix}-tokyo-tgw-attachment"
      Component = "network"
    },
    local.context.tags
  )
}














resource "aws_ec2_transit_gateway_route_table" "tokyo" {
  transit_gateway_id = aws_ec2_transit_gateway.tokyo.id

  tags = merge(
    {
      Name      = "${local.name_prefix}-tokyo-tgw-rt"
      Component = "network"
    },
    local.context.tags
  )
}

resource "aws_ec2_transit_gateway_route_table_association" "tokyo" {
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.tokyo.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tokyo.id
}




resource "aws_ec2_transit_gateway_route" "tokyo_to_saopaulo" {
  destination_cidr_block         = var.saopaulo_vpc_cidr # FIXME
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tokyo.id
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_peering_attachment.tokyo_to_saopaulo.id
}