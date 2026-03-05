# ================================================================
# EDGE — CloudFront Origin Authentication
# ================================================================

# Secret header value used for CloudFront → ALB verification
resource "random_password" "edge_auth_value" {
  length  = 32
  special = false
}