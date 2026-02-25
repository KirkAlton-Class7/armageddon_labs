locals {

base_tags = {
      Application = var.app
      Environment = var.env
      ManagedBy   = "terraform"
}

  context = {
    region = var.region
    app  = var.app
    env  = var.env
    tags = local.base_tags
    }
}

