# ----------------------------------------------------------------
# DATABASE OUTPUTS — Database
# ----------------------------------------------------------------

output "rds_subnets" {
  description = "Subnet IDs used by the RDS subnet group."
  value       = aws_db_subnet_group.lab_mysql.subnet_ids
}

output "db_endpoint" {
  description = "Endpoint address of the RDS instance."
  value       = aws_db_instance.lab_mysql.endpoint
}

output "db_identifier" {
  description = "Identifier of the RDS instance."
  value       = aws_db_instance.lab_mysql.identifier
}

output "db_secret_arn" {
  description = "Secrets Manager ARN containing database credentials."
  value       = aws_secretsmanager_secret.lab_rds_mysql.arn
}