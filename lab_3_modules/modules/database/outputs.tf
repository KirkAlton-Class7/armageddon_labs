output "db_endpoint" {
  value = module.aws_db_instance.lab_mysql.endpoint
}





output "db_endpoint" {
  value = aws_db_instance.lab_mysql.endpoint
}

output "db_identifier" {
  value = aws_db_instance.lab_mysql.identifier
}