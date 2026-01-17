# CWL Group - VPC Traffic
resource "aws_cloudwatch_log_group" "vpc_flow_log" {
  name = "vpc-flow-log"

  tags = {
    Name        = "vpc-flow-log"
    Environment = "${local.environment}"
    Component   = "logs-vpc"
    Scope       = "monitoring"
    }
}

# CWL Group - Private Data Subnet Traffic
resource "aws_cloudwatch_log_group" "private_data_subnet_flow_log" {
  name = "private-data-subnet-flow-log"

  tags = {
    Name        = "private-data-subnet-flow-log"
    Environment = "${local.environment}"
    Component   = "logs-subnet"
    Scope       = "monitoring"
    }
}