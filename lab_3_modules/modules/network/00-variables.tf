# ----------------------------------------------------------------
# INPUT VARIABLES — Networking
# ----------------------------------------------------------------

# Input VPC CIDR Block
variable "vpc_cidr" {
  type    = string
  description = "CIDR block for the VPC"
}


variable "context" {
  type = object({
    region = string
    app  = string
    env  = string
    tags = map(string)
  })
}