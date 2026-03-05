# ----------------------------------------------------------------
# COMPUTE OUTPUTS — Load Balancing (Listeners)
# ----------------------------------------------------------------

output "alb_listeners" {
  description = "ALB listener ports"
  value = {
    http  = aws_lb_listener.rds_app_http_80.port
    https = aws_lb_listener.rds_app_https_443.port
  }
}

# ----------------------------------------------------------------
# COMPUTE OUTPUTS — Load Balancing (Target Group)
# ----------------------------------------------------------------

output "rds_app_asg_tg_arn" {
  description = "ARN of the RDS App ASG Target Group"
  value       = aws_lb_target_group.rds_app_asg_tg.arn
}

output "rds_app_asg_tg_arn_suffix" {
  description = "ARN suffix of the Target Group used for CloudWatch metrics"
  value       = aws_lb_target_group.rds_app_asg_tg.arn_suffix
}

output "rds_app_asg_tg_name" {
  description = "Name of the RDS App ASG Target Group"
  value       = aws_lb_target_group.rds_app_asg_tg.name
}

output "rds_app_asg_tg_id" {
  description = "Unique ID of the Target Group"
  value       = aws_lb_target_group.rds_app_asg_tg.id
}

# ----------------------------------------------------------------
# COMPUTE OUTPUTS — Load Balancing (Application Load Balancer)
# ----------------------------------------------------------------

output "rds_app_public_alb_arn" {
  description = "ARN of the RDS App public ALB"
  value       = aws_lb.rds_app_public_alb.arn
}

output "rds_app_public_alb_arn_suffix" {
  description = "ARN suffix used for CloudWatch metrics"
  value       = aws_lb.rds_app_public_alb.arn_suffix
}

output "rds_app_public_alb_dns_name" {
  description = "DNS name of the public ALB"
  value       = aws_lb.rds_app_public_alb.dns_name
}

output "rds_app_public_alb_zone_id" {
  description = "Canonical hosted zone ID of the ALB"
  value       = aws_lb.rds_app_public_alb.zone_id
}

output "rds_app_public_alb_id" {
  description = "Unique ID of the ALB"
  value       = aws_lb.rds_app_public_alb.id
}

output "rds_app_public_alb_name" {
  description = "Name of the ALB"
  value       = aws_lb.rds_app_public_alb.name
}

# ----------------------------------------------------------------
# COMPUTE OUTPUTS — Compute (Auto Scaling Group)
# ----------------------------------------------------------------

output "rds_app_asg_name" {
  description = "Name of the RDS App Auto Scaling Group"
  value       = aws_autoscaling_group.rds_app_asg.name
}

output "rds_app_asg_arn" {
  description = "ARN of the RDS App Auto Scaling Group"
  value       = aws_autoscaling_group.rds_app_asg.arn
}

output "rds_app_asg_id" {
  description = "Unique ID of the RDS App Auto Scaling Group"
  value       = aws_autoscaling_group.rds_app_asg.id
}

output "rds_app_asg_desired_capacity" {
  description = "Desired instance capacity of the ASG"
  value       = aws_autoscaling_group.rds_app_asg.desired_capacity
}

output "rds_app_asg_min_size" {
  description = "Minimum number of instances in the ASG"
  value       = aws_autoscaling_group.rds_app_asg.min_size
}

output "rds_app_asg_max_size" {
  description = "Maximum number of instances in the ASG"
  value       = aws_autoscaling_group.rds_app_asg.max_size
}