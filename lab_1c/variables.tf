variable "application_name" {
  type    = string
  default = "sandbox"
}

variable "env" {
  type        = string
  default     = "dev"
  description = "Input environment name (dev, test, prod)."

  validation {
    condition     = contains(["dev", "test", "prod"], var.env)
    error_message = "Environment must be: dev, test, or prod."
  }
}

variable "region_choice" {
  type        = string
  default     = "2" # Defaults region to us-west-2
  description = <<EOT
Choose an Availability Zone by number:
    1   =   us-east-1
    2   =   us-west-2
    3   =   ca-central-1
    4   =   eu-west-1
    5   =   ap-northeast-1
    6   =   ap-southeast-2
EOT
  validation {
    condition     = contains(["1", "2", "3", "4", "5", "6"], var.region_choice)
    error_message = "AZ choice must be: 1, 2, 3, 4, 5, or 6."
  }
}

variable "region_map" {
  type = map(string)
  default = {
    "1" = "us-east-1"
    "2" = "us-west-2"
    "3" = "ca-central-1"
    "4" = "eu-west-1"
    "5" = "ap-northeast-1"
    "6" = "ap-southeast-2"
  }
}