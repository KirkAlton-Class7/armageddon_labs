# ----------------------------------------------------------------
# OUTPUTS — Database
# ----------------------------------------------------------------

output "rds_info" {
  description = "RDS Information"
  value = {
    name     = aws_db_instance.lab_mysql.tags["Name"]
    endpoint = module.aws_db_instance.lab_mysql.endpoint
    address  = aws_db_instance.lab_mysql.address
    port     = aws_db_instance.lab_mysql.port
  }
}

output "rds_subnets" {
  value       = aws_db_subnet_group.lab_mysql.subnet_ids
  description = "RDS Subnets"
}






output "db_endpoint" {
  value = aws_db_instance.lab_mysql.endpoint
}

output "db_identifier" {
  value = aws_db_instance.lab_mysql.identifier
}


output "db_secret_arn" {
  value = aws_secretsmanager_secret.lab_rds_mysql.arn
}
