# ================================================================
# DNS — HOSTED ZONES
# ================================================================

# ----------------------------------------------------------------
# DNS — Route53 Hosted Zone (Optional Terraform Management)
# ----------------------------------------------------------------
# Use data if the zone already exists.
# Use the conditional resource if you want to create a Terraform managed zone.

# Conditional Hosted Zone Resource for RDS App
resource "aws_route53_zone" "terraform_managed_zone" {
  count = var.manage_route53_in_terraform ? 1 : 0

  name = var.dns_context.root_domain
}

# Hosted Zone Data for RDS App
data "aws_route53_zone" "rds_app_zone" {
  count = var.manage_route53_in_terraform ? 0 : 1

  name         = var.dns_context.root_domain
  private_zone = false
}