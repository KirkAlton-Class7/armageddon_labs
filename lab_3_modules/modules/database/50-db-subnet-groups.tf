# ----------------------------------------------------------------
# DATABASE — RDS Subnet Group (Private Data Tier)
# ----------------------------------------------------------------

resource "aws_db_subnet_group" "lab_mysql" {
  name       = "lab-mysql-subnet-group"
  subnet_ids = var.private_data_subnets

  tags = merge(
    {
      Name = "labmysql-db-subnet-group"
      #Scope = aws_db_instance.lab_mysql.name
    },
    var.private_subnet_tags
  )
}
