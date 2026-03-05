# ----------------------------------------------------------------
# ROOT BACKEND — Terraform Backend Configuration
# ----------------------------------------------------------------
# Remote state backend configuration.
# The backend bucket may exist in a different region than the infrastructure.

# terraform {
#   backend "s3" {
#     bucket = "kirkdevsecops-terraform-state"
#     key    = "class7/terraform/dev/quick-vpc/terraform.tfstate"
#     region = "us-west-2"
#   }
# }