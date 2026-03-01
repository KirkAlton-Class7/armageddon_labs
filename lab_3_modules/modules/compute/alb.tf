# ----------------------------------------------------------------
# LOAD BALANCING — Application Load Balancer (Public)
# ----------------------------------------------------------------

# Public Application Load Balancer
resource "aws_lb" "rds_app_public_alb" {
  name               = "rds-app-alb-${var.name_suffix}"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [module.aws_security_group.alb_origin.id]
  subnets            = var.public_subnet_ids

  enable_deletion_protection = false

  # Access Logs for ALB
  access_logs {
    bucket  = aws_s3_bucket.alb_logs_bucket[0].id
    prefix  = var.alb_access_logs_prefix
    enabled = var.alb_log_mode
  }

  tags = {
    Name        = "rds-app-alb"
    Component   = "load-balancing"
    Environment = "${var.context.env}"
    Service     = "post-notes"
  }
}