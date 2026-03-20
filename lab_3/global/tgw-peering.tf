# ----------------------------------------------------------------
# GLOBAL TRANSIT GATEWAY PEERING — TOKYO → SAO PAULO)
# ----------------------------------------------------------------
# Initiates cross-region TGW peering

resource "aws_ec2_transit_gateway_peering_attachment" "tokyo_to_saopaulo" {
  transit_gateway_id      = data.terraform_remote_state.tokyo.outputs.tgw_id
  peer_transit_gateway_id = data.terraform_remote_state.saopaulo.outputs.tgw_id
  peer_region             = "sa-east-1"

  tags = {
    Name = "tokyo-to-saopaulo-tgw-peering"
  }
}

# ----------------------------------------------------------------
# GLOBAL TRANSIT GATEWAY PEERING — ACCEPTOR (SAO PAULO)
# ----------------------------------------------------------------

resource "aws_ec2_transit_gateway_peering_attachment_accepter" "saopaulo_accept" {
  transit_gateway_attachment_id = aws_ec2_transit_gateway_peering_attachment.tokyo_to_saopaulo.id

  tags = {
    Name = "saopaulo-accept-tgw-peering"
  }
}