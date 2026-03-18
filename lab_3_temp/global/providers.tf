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
# PROVIDERS — AWS Global / Edge Services
# ----------------------------------------------------------------

provider "aws" {
  region  = "us-east-1"
  profile = "default" # Uses credentials from ~/.aws/credentials

  default_tags {
    tags = {
      ManagedBy   = "terraform"
      Environment = local.context.env
      Application = local.context.app
      Scope       = "global-edge"
    }
  }
}

# ----------------------------------------------------------------
# PROVIDERS — AWS Regional Services (Application Region)
# ----------------------------------------------------------------

provider "aws" {
  alias   = "regional"
  region  = "us-west-2"
  profile = "default"

  default_tags {
    tags = {
      ManagedBy   = "terraform"
      Environment = local.context.env
      Application = local.context.app
      Scope       = "regional-support"
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