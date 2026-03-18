# ----------------------------------------------------------------
# TOKYO — Terraform Configuration
# ----------------------------------------------------------------

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.18.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "3.7.2"
    }
  }
}

# ----------------------------------------------------------------
# PROVIDERS — AWS Regional (Application Infrastructure)
# ----------------------------------------------------------------

provider "aws" {
  region  = var.region
  profile = "default" # Uses AWS credentials from [default] profile in ~/.aws/credentials

  default_tags {
    tags = {
      ManagedBy   = "terraform"
      Environment = local.context.env
      Application = local.context.app
    }
  }
}

# ----------------------------------------------------------------
# PROVIDERS — Auxiliary
# ----------------------------------------------------------------

provider "local" {}

provider "random" {}

# ----------------------------------------------------------------
# DATA — AWS Account Identity
# ----------------------------------------------------------------

data "aws_caller_identity" "current" {}