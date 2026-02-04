resource "aws_cloudwatch_dashboard" "rds_app_dashboard" {
  dashboard_name = "rds-app-dashboard"

  dashboard_body = jsonencode({
    widgets = [
      {
        type   = "metric"
        x      = 0
        y      = 0
        width  = 6
        height = 6
        properties = {
          title = "ALB 5xx Errors (RDS App)"
          metrics = [
            ["Custom/VPC", "RdsAppAlbServerError", "App", local.application]
          ]
          stat   = "Sum"
          region = local.region
          period = 60
        }
      },
      {
        type   = "metric"
        x      = 6
        y      = 0
        width  = 6
        height = 6
        properties = {
          title = "Public App → RDS: REJECTed Port 3306"
          metrics = [
            ["Custom/VPC", "PublicAppToLabMySqlConnectionFailure", "App", local.application]
          ]
          stat   = "Sum"
          region = local.region
          period = 60
        }
      },
      {
        type   = "metric"
        x      = 0
        y      = 6
        width  = 6
        height = 6
        properties = {
          title = "MySQL Auth Failures"
          metrics = [
            ["Custom/RDS", "MySQLAuthFailure", "App", local.application]
          ]
          stat   = "Sum"
          region = local.region
          period = 60
        }
      }
    ]
  })

  #   tags = {
  #     Name        = "rds-app-dashboard"
  #     App         = local.application
  #     Environment = local.environment
  #     Component   = "dashboard"
  #     Scope       = "observability"
  #     Severity    = "info"
  #   }
}
