








variable "context" {
  type = object(
    {
      region = string
      app    = string
      env    = string
      tags   = map(string)
    }
  )
}





# Public Subnet IDs
variable "public_subnets" {
  description = "Public subnet IDs"
  type = list(string)
}

# Private App Subnet IDs
variable "private_app_subnets" {
  description = "Private app subnet IDs"
  type = list(string)
}

# Private Data Subnet IDs
variable "private_data_subnets" {
  description = "Private data subnet IDs"
  type = list(string)
}

# Name Prefix
variable "name_prefix" {
  type = string
}

# Name Suffix
variable "name_suffix" {
  type = string
}



variable "public_subnet_tags" {
  type = map(string)
  description = "Tags for public subnets and resources"
}

  # Shared tags for private app subnets and resources
variable "private_app_subnet_tags" {
  type = map(string)
  description = "Tags for private app subnets and resources"
}

  # Shared tags for private data subnets and resources
variable "private_data_subnet_tags" {
  type = map(string)
  description = "Tags for private subnets and resources"
}


# SECURITY GROUPS

# DB SG ID
variable "private_db_sg_id" {
  type = string
  description = "Security Group ID for Private DB"
}

# FROM ROOT
variable "db_engine" {
  description = "Database engine."
  type        = string
}

# DB Username
variable "db_username" {
  type        = string
  description = "Database admin username"
}