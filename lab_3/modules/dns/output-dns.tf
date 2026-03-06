# ----------------------------------------------------------------
# DNS OUTPUTS — DNS Records
# ----------------------------------------------------------------

output "rds_app_origin_record" {
  description = "Route53 origin A record pointing to the ALB."
  value = {
    fqdn    = aws_route53_record.rds_app_origin_to_alb.fqdn
    name    = aws_route53_record.rds_app_origin_to_alb.name
    zone_id = aws_route53_record.rds_app_origin_to_alb.zone_id
    type    = aws_route53_record.rds_app_origin_to_alb.type
  }
}

# ----------------------------------------------------------------
# DNS OUTPUTS — Hosted Zone Details
# ----------------------------------------------------------------

output "route53_zone" {
  description = "Route53 hosted zone details."

  value = {
    arn          = data.aws_route53_zone.rds_app_zone[0].arn
    id           = data.aws_route53_zone.rds_app_zone[0].zone_id
    name         = data.aws_route53_zone.rds_app_zone[0].name
    name_servers = data.aws_route53_zone.rds_app_zone[0].name_servers
    comment      = data.aws_route53_zone.rds_app_zone[0].comment
  }
}