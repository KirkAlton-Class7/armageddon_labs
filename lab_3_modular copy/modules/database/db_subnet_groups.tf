# ----------------------------------------------------------------
# DATABASE — RDS Subnet Group (Private Data Tier)
# ----------------------------------------------------------------

resource "aws_db_subnet_group" "lab_mysql" {
  name       = "lab-mysql-subnet-group"
  subnet_ids = var.private_data_subnets

  tags = merge(
    {
      Name = "labmysql-db-subnet-group"
    },
    var.private_data_subnet_tags, var.context.tags
  )
}
