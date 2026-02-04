resource "aws_cloudwatch_dashboard" "rds_app_dashboard" {
  dashboard_name = "post-notes-infra-dashboard"

  dashboard_body = jsonencode({
    start = "-PT6H",
    periodOverride = "inherit",
    widgets = [

      ## ========== EC2 ASG METRICS ==========
      {
        type: "metric",
        x: 0, y: 0, width: 12, height: 6,
        properties: {
          title: "ASG CPU Utilization",
          metrics: [
            [ "AWS/EC2", "CPUUtilization", "AutoScalingGroupName", "rds-app-asg" ]
          ],
          stat: "Average",
          region: local.region,
          period: 300,
          view: "timeSeries"
        }
      },
      {
        type: "metric",
        x: 12, y: 0, width: 12, height: 6,
        properties: {
          title: "Memory Utilization (CloudWatch Agent)",
          metrics: [
            [ "CWAgent", "mem_used_percent", "InstanceId", "i-*", { "stat": "Average" } ]
          ],
          region: local.region,
          period: 300,
          view: "timeSeries"
        }
      },

      ## ========== RDS METRICS ==========
      {
        type: "metric",
        x: 0, y: 6, width: 12, height: 6,
        properties: {
          title: "RDS CPU & Memory",
          metrics: [
            [ "AWS/RDS", "CPUUtilization", "DBInstanceIdentifier", "lab-mysql-*" ],
            [ ".", "FreeableMemory", ".", "." ]
          ],
          region: local.region,
          period: 300,
          view: "timeSeries"
        }
      },
      {
        type: "metric",
        x: 12, y: 6, width: 12, height: 6,
        properties: {
          title: "MySQL Auth Failures",
          metrics: [
            [ "Custom/RDS", "MySQLAuthFailure", { "stat": "Sum" } ]
          ],
          region: local.region,
          view: "timeSeries",
          period: 60
        }
      },

      ## ========== ALB / WAF METRICS ==========
      {
        type: "metric",
        x: 0, y: 12, width: 12, height: 6,
        properties: {
          title: "ALB 5xx Errors",
          metrics: [
            [ "Custom/VPC", "RdsAppAlbServerError", { "stat": "Sum" } ]
          ],
          region: local.region,
          view: "timeSeries",
          period: 60
        }
      },
      {
        type: "metric",
        x: 12, y: 12, width: 12, height: 6,
        properties: {
          title: "WAF Blocked Requests",
          metrics: [
            [ "AWS/WAFV2", "BlockedRequests", "WebACL", "web-acl-rds-app-*" ]
          ],
          region: local.region
          period: 300
        }
      },

      ## ========== ALARMS ==========
      {
        type: "alarm",
        x: 0, y: 18, width: 8, height: 6,
        properties: {
          title: "DB Auth Failures",
          alarms: [ aws_cloudwatch_metric_alarm.alarm_lab_mysql_auth_failure.arn ]
        }
      },
      {
        type: "alarm",
        x: 8, y: 18, width: 8, height: 6,
        properties: {
          title: "App to LabMySQL Connection Failures",
          alarms: [ aws_cloudwatch_metric_alarm.rds_app_to_lab_mysql_connection_failure.arn ]
        }
      },
      {
        type: "alarm",
        x: 16, y: 18, width: 8, height: 6,
        properties: {
          title: "ALB Server Errors",
          alarms: [ aws_cloudwatch_metric_alarm.rds_app_alb_server_error_alarm.arn ]
        }
      }
    ]
  })
}
