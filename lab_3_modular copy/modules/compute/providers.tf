terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"

    # Add provider aliases if needed:
    #   configuration_aliases = [
    #     aws.global
    #   ]
    }
  }
}