
# Auto Scaling Group for RDS App ASG
resource "aws_autoscaling_group" "rds_app_asg" {
  name                = "rds-app-asg"
  vpc_zone_identifier = local.private_app_subnets

  desired_capacity  = 3
  max_size          = 6
  min_size          = 3
  health_check_type = "ELB"
  target_group_arns = [aws_lb_target_group.rds_app_asg_tg.arn] # Target group to attach the ASG to. A list of ARNS is expected for an ASG, so use brackets and add an "s" make "target_group_arn" plural.
  force_delete      = true

  launch_template {
    id      = aws_launch_template.rds_app_asg.id
    version = "$Latest"
  }
  tag {
    key                 = "Environment" # Keep this tag block to add addtional metadata to the instances (launch template handles main tags like name, owner, etc.)
    value               = var.env
    propagate_at_launch = true
  }

}

# ASG Policy
resource "aws_autoscaling_policy" "rds_app_asg" {
  name                      = "rds-app-asg-policy"
  autoscaling_group_name    = aws_autoscaling_group.rds_app_asg.id
  policy_type               = "TargetTrackingScaling"
  estimated_instance_warmup = 60


  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = 40.0
  }
}