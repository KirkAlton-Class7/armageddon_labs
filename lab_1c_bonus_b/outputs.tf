output "application_name" {
  description = "Application name"
  value       = var.application_name
}

output "environment" {
  description = "Environment"
  value       = local.environment
}

output "region_choice" {
  description = "Region choice (number)"
  value       = var.region_choice
}

output "region" {
  description = "Region (name)"
  value       = local.region
}

output "availability_zones" {
  description = "Avialability Zones"
  value       = data.aws_availability_zones.available.names
}

output "vpc_info" {
  description = "VPC ID, Name and CIDR block"
  value = {
    id   = aws_vpc.main.id
    name = aws_vpc.main.tags["Name"]
    cidr = aws_vpc.main.cidr_block
  }
}


output "rds_info" {
  description = "RDS Information"
  value = {
    name     = aws_db_instance.lab_mysql.tags["Name"]
    endpoint = aws_db_instance.lab_mysql.endpoint
    address  = aws_db_instance.lab_mysql.address
    port     = aws_db_instance.lab_mysql.port
  }
}

output "rds_subnets" {
  value       = aws_db_subnet_group.lab_mysql.subnet_ids
  description = "RDS Subnets"
}


# RDS App ALB Output
output "rds_app_alb" {
  description = "RDS App ALB: Name, Subnets, URL"
  value = [
    {
      name    = aws_lb.rds_app_public_alb.tags["Name"]
      subnets = aws_lb.rds_app_public_alb.subnets
      url     = aws_route53_record.rds_app_alias.name
      url     = "http://${aws_lb.rds_app_public_alb.dns_name}/"
    }
  ]
}
