terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.18.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "3.7.2"
    }

    local = {
      source = "hashicorp/local"
    }
  }
}

# ----------------------------------------------------------------
# PROVIDERS — TOKYO (TGW HUB)
# ----------------------------------------------------------------
provider "aws" {
  alias  = "tokyo"
  region = "ap-northeast-1"

  default_tags {
    tags = merge(
      {
        ManagedBy = "terraform"
        Scope     = "apac"
        Role      = "tgw-${var.tgw_role}"
      },
      local.context.tags
    )
  }
}

# ----------------------------------------------------------------
# PROVIDERS — SAO PAULO (TGW SPOKE)
# ----------------------------------------------------------------
provider "aws" {
  alias  = "saopaulo"
  region = "sa-east-1"

  default_tags {
    tags = merge(
      {
        ManagedBy = "terraform"
        Scope     = "latam"
        Role      = "tgw-${var.tgw_role}"
      },
      local.context.tags
    )
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