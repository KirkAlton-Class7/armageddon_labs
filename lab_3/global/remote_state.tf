# ----------------------------------------------------------------
# GLOBAL REMOTE STATE — Read Regional Infrastructure: Tokyo
# ----------------------------------------------------------------
# Reads outputs from the Tokyo regional stack.
# Used as origin infrastructure for global edge/DNS components.
# Configuration must match the backend settings defined in the Tokyo stack.

data "terraform_remote_state" "tokyo" {
  backend = "s3"

  config = {
    bucket = "kirkdevsecops-terraform-state"
    key    = "rds-app/dev/regions/tokyo/terraform.tfstate"
    region = "us-west-2"
  }
}

# # ----------------------------------------------------------------
# # GLOBAL — Remote State (Regional Infrastructure: Sao Paulo)
# # ----------------------------------------------------------------
# # Reads outputs from the Tokyo regional stack.
# # Used as origin infrastructure for global edge/DNS components.
# # Configuration must match the backend settings defined in the Tokyo stack.

# data "terraform_remote_state" "tokyo" {
#   backend = "s3"

#   config = {
#     bucket = "kirkdevsecops-terraform-state"
#     key    = "rds-app/dev/regions/tokyo/terraform.tfstate"
#     region = "us-west-2"
#   }
# }

# data "terraform_remote_state" "tokyo" {
#   backend = "s3"

#   config = {
#     bucket = "kirkdevsecops-terraform-state"
#     key    = "rds-app/dev/regions/tokyo/terraform.tfstate"
#     region = "us-west-2"
#   }
# }