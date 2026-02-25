locals {
  base_tags = {
    Application = var.app
    Environment = var.env
    ManagedBy   = "terraform"
  }
}