locals {
  # -------------------------------------------------------------------
  # Security & Identity
  # -------------------------------------------------------------------
  # Security Group IDs
  alb_sg_id = module.aws_security_group.alb_origin.id
  # rds_app_ec2_sg_id        = aws_security_group.rds_app_ec2.id
  rds_app_asg_sg_id = aws_security_group.rds_app_asg
  private_db_sg_id  = aws_security_group.private_db.id

  # Database Credentials
  db_credentials = {
    username = "admin"
    password = random_password.db_password.result # TODO: Update to vault key
  }

  # DB Secret ID
  secret_id = aws_secretsmanager_secret.lab_rds_mysql.arn
}