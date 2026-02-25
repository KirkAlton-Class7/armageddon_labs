# ----------------------------------------------------------------
# INPUT VARIABLES — Environment
# ----------------------------------------------------------------
# Input Application Name
variable "app" {
  type        = string
  description = "Application name (short)"
  default     = "rds-app"
}

# Input Environment 
variable "env" {
  type        = string
  default     = "dev"
  description = "Input environment name (dev, test, prod)."

  validation {
    condition     = contains(["dev", "test", "prod"], var.env)
    error_message = "Environment must be: dev, test, or prod."
  }
}