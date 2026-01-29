# ALB Target Group Attachment
# Create a new ALB Target Group attachment
resource "aws_autoscaling_attachment" "internal_app_asg_tg_attachment" {
  autoscaling_group_name = aws_autoscaling_group.internal_app_asg.id
  lb_target_group_arn    = aws_lb_target_group.internal_app_asg_tg.arn
}