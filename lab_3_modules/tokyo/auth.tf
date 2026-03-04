# =============================================================================
# FOUNDATION — Terraform & Provider Configuration
# =============================================================================

# ----------------------------------------------------------------
# Required Providers
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
# AWS Provider — Regional (Application Infrastructure)
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
# AWS Provider — Global Services
# ----------------------------------------------------------------
provider "aws" {
  alias  = "global"
  region = "us-east-1"

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
# Auxillary Providers
# ----------------------------------------------------------------
provider "local" {}

provider "random" {}

# ----------------------------------------------------------------
# Account Identity (Data Source)
# ----------------------------------------------------------------
data "aws_caller_identity" "current" {}


# ----------------------------------------------------------------
# NETWORKING — Availability Zones
# ----------------------------------------------------------------
data "aws_availability_zones" "available" {
  state = "available"
}
# ----------------------------------------------------------------
# NETWORKING — Validate AZ Count 
# ----------------------------------------------------------------
resource "null_resource" "validate_az_count" {

  lifecycle {
    precondition {
      condition     = length(data.aws_availability_zones.available.names) >= 3
      error_message = "This deployment requires a region with at least 3 Availability Zones. Please select a different region."
    }
  }
}