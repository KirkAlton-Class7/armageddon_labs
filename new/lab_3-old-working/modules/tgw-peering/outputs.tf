# ----------------------------------------------------------------
# TGW PEERING OUTPUTS — Transit Gateway Peering
# ----------------------------------------------------------------

output "tgw_peering_attachment_id" {
  description = "Transit Gateway peering attachment ID."
  value       = aws_ec2_transit_gateway_peering_attachment.tgw_peering_request.id
}