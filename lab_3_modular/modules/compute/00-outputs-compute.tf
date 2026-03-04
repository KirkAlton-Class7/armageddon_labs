# ----------------------------------------------------------------
# OUTPUTS — Load Balancing
# ----------------------------------------------------------------



# RDS App ALB Listeners
output "alb_listeners" {
  description = "ALB listener ports"
  value = {
    http  = aws_lb_listener.rds_app_http_80.port
    https = aws_lb_listener.rds_app_https_443.port
  }
}









# ----------------------------------------------------------------
# OUTPUT — Target Group ARN
# ----------------------------------------------------------------
output "rds_app_asg_tg_arn" {
  description = "ARN of the RDS App ASG Target Group"
  value       = aws_lb_target_group.rds_app_asg_tg.arn
}

# ----------------------------------------------------------------
# OUTPUT — Target Group ARN Suffix
# ----------------------------------------------------------------
output "rds_app_asg_tg_arn_suffix" {
  description = "ARN suffix of the Target Group used for CloudWatch metrics"
  value       = aws_lb_target_group.rds_app_asg_tg.arn_suffix
}

# ----------------------------------------------------------------
# OUTPUT — Target Group Name
# ----------------------------------------------------------------
output "rds_app_asg_tg_name" {
  description = "Name of the RDS App ASG Target Group"
  value       = aws_lb_target_group.rds_app_asg_tg.name
}

# ----------------------------------------------------------------
# OUTPUT — Target Group ID
# ----------------------------------------------------------------
output "rds_app_asg_tg_id" {
  description = "Unique ID of the Target Group"
  value       = aws_lb_target_group.rds_app_asg_tg.id
}



# # ----------------------------------------------------------------
# # INPUT — Target Group ARN
# # ----------------------------------------------------------------
# variable "rds_app_asg_tg_arn" {
#   description = "ARN of the RDS App ASG Target Group"
#   type        = string
# }

# # ----------------------------------------------------------------
# # INPUT — Target Group ARN Suffix
# # ----------------------------------------------------------------
# variable "rds_app_asg_tg_arn_suffix" {
#   description = "ARN suffix used for CloudWatch metrics"
#   type        = string
# }

# # ----------------------------------------------------------------
# # INPUT — Target Group Name
# # ----------------------------------------------------------------
# variable "rds_app_asg_tg_name" {
#   description = "Name of the RDS App ASG Target Group"
#   type        = string
# }

# # ----------------------------------------------------------------
# # INPUT — Target Group ID
# # ----------------------------------------------------------------
# variable "rds_app_asg_tg_id" {
#   description = "Unique ID of the Target Group"
#   type        = string
# }


  # rds_app_asg_tg_arn        = module.compute.rds_app_asg_tg_arn
  # rds_app_asg_tg_arn_suffix = module.compute.rds_app_asg_tg_arn_suffix
  # rds_app_asg_tg_name       = module.compute.rds_app_asg_tg_name
  # rds_app_asg_tg_id         = module.compute.rds_app_asg_tg_id









# ----------------------------------------------------------------
# OUTPUT — ALB ARN
# ----------------------------------------------------------------
output "rds_app_public_alb_arn" {
  description = "ARN of the RDS App public ALB"
  value       = aws_lb.rds_app_public_alb.arn
}

# ----------------------------------------------------------------
# OUTPUT — ALB ARN Suffix
# ----------------------------------------------------------------
output "rds_app_public_alb_arn_suffix" {
  description = "ARN suffix used for CloudWatch metrics"
  value       = aws_lb.rds_app_public_alb.arn_suffix
}

# ----------------------------------------------------------------
# OUTPUT — ALB DNS Name
# ----------------------------------------------------------------
output "rds_app_public_alb_dns_name" {
  description = "DNS name of the public ALB"
  value       = aws_lb.rds_app_public_alb.dns_name
}

# ----------------------------------------------------------------
# OUTPUT — ALB Zone ID
# ----------------------------------------------------------------
output "rds_app_public_alb_zone_id" {
  description = "Canonical hosted zone ID of the ALB"
  value       = aws_lb.rds_app_public_alb.zone_id
}

# ----------------------------------------------------------------
# OUTPUT — ALB ID
# ----------------------------------------------------------------
output "rds_app_public_alb_id" {
  description = "Unique ID of the ALB"
  value       = aws_lb.rds_app_public_alb.id
}

# ----------------------------------------------------------------
# OUTPUT — ALB Name
# ----------------------------------------------------------------
output "rds_app_public_alb_name" {
  description = "Name of the ALB"
  value       = aws_lb.rds_app_public_alb.name
}


# # ----------------------------------------------------------------
# # INPUT — ALB ARN
# # ----------------------------------------------------------------
# variable "rds_app_public_alb_arn" {
#   description = "ARN of the RDS App public ALB"
#   type        = string
# }

# # ----------------------------------------------------------------
# # INPUT — ALB ARN Suffix
# # ----------------------------------------------------------------
# variable "rds_app_public_alb_arn_suffix" {
#   description = "ARN suffix used for CloudWatch metrics"
#   type        = string
# }

# # ----------------------------------------------------------------
# # INPUT — ALB DNS Name
# # ----------------------------------------------------------------
# variable "rds_app_public_alb_dns_name" {
#   description = "DNS name of the public ALB"
#   type        = string
# }

# # ----------------------------------------------------------------
# # INPUT — ALB Zone ID
# # ----------------------------------------------------------------
# variable "rds_app_public_alb_zone_id" {
#   description = "Canonical hosted zone ID of the ALB"
#   type        = string
# }

# # ----------------------------------------------------------------
# # INPUT — ALB ID
# # ----------------------------------------------------------------
# variable "rds_app_public_alb_id" {
#   description = "Unique ID of the ALB"
#   type        = string
# }

# # ----------------------------------------------------------------
# # INPUT — ALB Name
# # ----------------------------------------------------------------
# variable "rds_app_public_alb_name" {
#   description = "Name of the ALB"
#   type        = string
# }

  # rds_app_public_alb_arn        = module.compute.rds_app_public_alb_arn
  # rds_app_public_alb_arn_suffix = module.compute.rds_app_public_alb_arn_suffix
  # rds_app_public_alb_dns_name   = module.compute.rds_app_public_alb_dns_name
  # rds_app_public_alb_zone_id    = module.compute.rds_app_public_alb_zone_id
  # rds_app_public_alb_id         = module.compute.rds_app_public_alb_id
  # rds_app_public_alb_name       = module.compute.rds_app_public_alb_name











  # ----------------------------------------------------------------
# OUTPUT — ASG Name
# ----------------------------------------------------------------
output "rds_app_asg_name" {
  description = "Name of the RDS App Auto Scaling Group"
  value       = aws_autoscaling_group.rds_app_asg.name
}

# ----------------------------------------------------------------
# OUTPUT — ASG ARN
# ----------------------------------------------------------------
output "rds_app_asg_arn" {
  description = "ARN of the RDS App Auto Scaling Group"
  value       = aws_autoscaling_group.rds_app_asg.arn
}

# ----------------------------------------------------------------
# OUTPUT — ASG ID
# ----------------------------------------------------------------
output "rds_app_asg_id" {
  description = "Unique ID of the RDS App Auto Scaling Group"
  value       = aws_autoscaling_group.rds_app_asg.id
}

# ----------------------------------------------------------------
# OUTPUT — ASG Desired Capacity
# ----------------------------------------------------------------
output "rds_app_asg_desired_capacity" {
  description = "Desired instance capacity of the ASG"
  value       = aws_autoscaling_group.rds_app_asg.desired_capacity
}

# ----------------------------------------------------------------
# OUTPUT — ASG Min Size
# ----------------------------------------------------------------
output "rds_app_asg_min_size" {
  description = "Minimum number of instances in the ASG"
  value       = aws_autoscaling_group.rds_app_asg.min_size
}

# ----------------------------------------------------------------
# OUTPUT — ASG Max Size
# ----------------------------------------------------------------
output "rds_app_asg_max_size" {
  description = "Maximum number of instances in the ASG"
  value       = aws_autoscaling_group.rds_app_asg.max_size
}


# # ----------------------------------------------------------------
# # INPUT — ASG Name
# # ----------------------------------------------------------------
# variable "rds_app_asg_name" {
#   description = "Name of the RDS App Auto Scaling Group"
#   type        = string
# }

# # ----------------------------------------------------------------
# # INPUT — ASG ARN
# # ----------------------------------------------------------------
# variable "rds_app_asg_arn" {
#   description = "ARN of the RDS App Auto Scaling Group"
#   type        = string
# }

# # ----------------------------------------------------------------
# # INPUT — ASG ID
# # ----------------------------------------------------------------
# variable "rds_app_asg_id" {
#   description = "Unique ID of the RDS App Auto Scaling Group"
#   type        = string
# }

# # ----------------------------------------------------------------
# # INPUT — ASG Desired Capacity
# # ----------------------------------------------------------------
# variable "rds_app_asg_desired_capacity" {
#   description = "Desired instance capacity"
#   type        = number
# }

# # ----------------------------------------------------------------
# # INPUT — ASG Min Size
# # ----------------------------------------------------------------
# variable "rds_app_asg_min_size" {
#   description = "Minimum number of instances"
#   type        = number
# }

# # ----------------------------------------------------------------
# # INPUT — ASG Max Size
# # ----------------------------------------------------------------
# variable "rds_app_asg_max_size" {
#   description = "Maximum number of instances"
#   type        = number
# }



  # rds_app_asg_name             = module.compute.rds_app_asg_name
  # rds_app_asg_arn              = module.compute.rds_app_asg_arn
  # rds_app_asg_id               = module.compute.rds_app_asg_id
  # rds_app_asg_desired_capacity = module.compute.rds_app_asg_desired_capacity
  # rds_app_asg_min_size         = module.compute.rds_app_asg_min_size
  # rds_app_asg_max_size         = module.compute.rds_app_asg_max_size



