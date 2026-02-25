# ----------------------------------------------------------------
# Naming Suffix Generators
# ----------------------------------------------------------------
# Random string for resource name suffixes
resource "random_string" "suffix" {
  length  = 5
  special = false
}

# ----------------------------------------------------------------
# S3 Buckets
# ----------------------------------------------------------------
# Random Hex ID for globally unique bucket names
resource "random_id" "bucket_suffix" {
  byte_length = 4
}