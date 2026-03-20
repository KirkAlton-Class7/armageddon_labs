# ----------------------------------------------------------------
# GLOBAL — Terraform Configuration
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
# PROVIDERS — AWS Regional Services (Tokyo)
# ----------------------------------------------------------------
provider "aws" {
  alias   = "tokyo"
  region  = "ap-northeast-1"
  profile = "default"

  default_tags {
    tags = {
      ManagedBy   = "terraform"
      Environment = local.context.env
      Application = local.context.app
      Scope       = "apac"
    }
  }
}

# ----------------------------------------------------------------
# PROVIDERS — AWS Regional Services (Sao Paulo)
# ----------------------------------------------------------------
provider "aws" {
  alias   = "saopaulo"
  region  = "sa-east-1"
  profile = "default"

  default_tags {
    tags = {
      ManagedBy   = "terraform"
      Environment = local.context.env
      Application = local.context.app
      Scope       = "latam"
    }
  }
}

# ----------------------------------------------------------------
# PROVIDERS — Auxiliary
# ----------------------------------------------------------------

provider "random" {}

provider "local" {}

# ----------------------------------------------------------------
# DATA — AWS Account Identity
# ----------------------------------------------------------------

data "aws_caller_identity" "current" {}