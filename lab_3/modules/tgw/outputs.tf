# ----------------------------------------------------------------
# TRANSIT GATEWAY OUTPUTS — Core Resources
# ----------------------------------------------------------------

output "tgw_id" {
  description = "Transit Gateway ID."
  value       = aws_ec2_transit_gateway.main.id
}

output "tgw_route_table_id" {
  description = "Transit Gateway route table ID."
  value       = aws_ec2_transit_gateway_route_table.main_rt.id
}

output "tgw_attachment_id" {
  description = "Transit Gateway VPC attachment ID."
  value       = aws_ec2_transit_gateway_vpc_attachment.vpc_attachment.id
}

# ----------------------------------------------------------------
# TRANSIT GATEWAY OUTPUTS — Operator / Observability
# ----------------------------------------------------------------

output "tgw_name" {
  description = "Name tag of the Transit Gateway."
  value       = aws_ec2_transit_gateway.main.tags["Name"]
}