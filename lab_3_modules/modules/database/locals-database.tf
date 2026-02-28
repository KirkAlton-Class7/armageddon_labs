locals {
  # -------------------------------------------------------------------
  # Security & Identity
  # -------------------------------------------------------------------

  # Database Credentials
  db_credentials = {
    username = "admin"
    password = random_password.db_password.result # TODO: Update to vault key
  }

  # DB Port Map
  db_ports = {
    mysql     = 3306
    postgres  = 5432
    sqlserver = 1433
    oracle    = 1521
  }

  db_port = local.db_ports[lower(var.db_engine)]


  # DB Secret ID
  secret_id = aws_secretsmanager_secret.lab_rds_mysql.arn
}