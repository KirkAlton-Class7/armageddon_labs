# Public Application Load Balancer
resource "aws_lb" "rds_app_public_alb" {
  name               = "rds-app-public-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.public_alb.id]
  subnets            = local.public_subnets


  enable_deletion_protection = false

  # Add Access Logs Later
  # access_logs {
  #   bucket  = aws_s3_bucket.lb_logs.id
  #   prefix  = "rds-app-lb-01"
  #   enabled = true
  # }

  tags = {
    Name = "rds-app-public-alb"
  }
}

