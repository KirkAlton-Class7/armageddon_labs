# Public Application Load Balancer
resource "aws_lb" "rds_app_public_alb" {
  name               = "rds-app-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb.id]
  subnets            = local.public_subnets


  enable_deletion_protection = false
  
  # Access Logs for ALB
  access_logs {
    bucket  = aws_s3_bucket.alb_logs.id
    prefix  = "rds-app-alb"
    enabled = true
  }

  tags = {
    Name = "rds-app-alb-logs"
  }
}

# S3 Bucket for ALB Access Logs
resource "aws_s3_bucket" "alb_logs" {
  bucket = "armageddon-lab-1c-bonus-b-alb-logs-${local.region}-${local.bucket_suffix}"

  tags = {
    Name        = "alb-logs-bucket"
    Environment = "${local.environment}"
  }
}
