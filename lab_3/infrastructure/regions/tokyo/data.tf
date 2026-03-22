data "aws_s3_bucket" "alb_logs" {
  bucket = "alb-logs-${local.context.region}-${local.bucket_suffix}"
}