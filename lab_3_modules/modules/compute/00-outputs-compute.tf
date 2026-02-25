# ----------------------------------------------------------------
# OUTPUTS — Load Balancing
# ----------------------------------------------------------------

# RDS App ALB Info
output "rds_app_alb" {
  description = "ALB Information"

  value = {
    application = local.app
    name        = aws_lb.rds_app_public_alb.name
    dns_name    = aws_lb.rds_app_public_alb.dns_name
    zone_id     = aws_lb.rds_app_public_alb.zone_id
    a_record    = aws_route53_record.rds_app_origin_to_alb.name
  }
}

# RDS App ALB Listeners
output "alb_listeners" {
  description = "ALB listener ports"
  value = {
    http  = aws_lb_listener.rds_app_http_80.port
    https = aws_lb_listener.rds_app_https_443.port
  }
}