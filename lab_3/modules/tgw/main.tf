resource "aws_ec2_transit_gateway" "this" {
  description = "${var.name_prefix}-${var.context.region}-tgw"

  auto_accept_shared_attachments  = "disable"
  default_route_table_association = "disable"
  default_route_table_propagation = "disable"

  tags = merge(
    {
      Name      = "${var.name_prefix}-${var.context.region}-tgw"
      Component = "network"
      Role      = var.tgw_role
    },
    var.tgw_tags
  )
}

resource "aws_ec2_transit_gateway_vpc_attachment" "this" {
  transit_gateway_id = aws_ec2_transit_gateway.this.id

  vpc_id     = var.vpc_id
  subnet_ids = var.private_app_subnet_ids

  tags = merge(
    {
      Name      = "${var.name_prefix}-${var.contet.region}-tgw-attachment"
      Component = "network"
    },
    var.tgw_tags
  )
}

resource "aws_ec2_transit_gateway_route_table" "this" {
  transit_gateway_id = aws_ec2_transit_gateway.this.id

  tags = merge(
    {
      Name      = "${var.name_prefix}-${var.context.region}-tgw-rt"
      Component = "network"
    },
    var.tgw_tags
  )
}

resource "aws_ec2_transit_gateway_route_table_association" "this" {
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.this.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.this.id
}