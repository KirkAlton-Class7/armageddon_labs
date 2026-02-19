# ----------------------------------------------------------------
# AWS Providers
# ----------------------------------------------------------------

# ----------------------------------------------------------------
# Terraform & Provider Configuration
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

# Primary Regional Provider (Application Infrastructure)
provider "aws" {
  region  = local.region
  profile = "default" # Uses AWS credentials from [default] profile in ~/.aws/credentials

  default_tags {
    tags = {
      ManagedBy   = "terraform"
      Environment = local.env
      Application = local.app
    }
  }
}

# Global Provider (CloudFront/Edge Resources)
provider "aws" {
  alias  = "global"
  region = "us-east-1"

  default_tags {
    tags = {
      ManagedBy   = "terraform"
      Environment = local.env
      Application = local.app
      Scope       = "global-edge"
    }
  }
}


# ----------------------------------------------------------------
# Additional Providers and Helpers
# ----------------------------------------------------------------

provider "local" {}

provider "random" {}

# Data for Current Account ID
data "aws_caller_identity" "current" {}
