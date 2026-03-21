# # ----------------------------------------------------------------
# # GLOBAL TRANSIT GATEWAY ROUTE — TOKYO → SAO PAULO
# # ----------------------------------------------------------------

# resource "aws_ec2_transit_gateway_route" "tokyo_to_saopaulo" {
#   provider = aws.tokyo

#   destination_cidr_block         = data.terraform_remote_state.saopaulo.outputs.vpc_cidr
#   transit_gateway_route_table_id = data.terraform_remote_state.tokyo.outputs.tgw_route_table_id
#   transit_gateway_attachment_id  = aws_ec2_transit_gateway_peering_attachment.tokyo_to_saopaulo.id
# }

# # ----------------------------------------------------------------
# # GLOBAL TRANSIT GATEWAY ROUTE — SAO PAULO → TOKYO
# # ----------------------------------------------------------------

# resource "aws_ec2_transit_gateway_route" "saopaulo_to_tokyo" {
#   provider = aws.saopaulo

#   destination_cidr_block         = data.terraform_remote_state.tokyo.outputs.vpc_cidr
#   transit_gateway_route_table_id = data.terraform_remote_state.saopaulo.outputs.tgw_route_table_id
#   transit_gateway_attachment_id  = aws_ec2_transit_gateway_peering_attachment.tokyo_to_saopaulo.id
# }