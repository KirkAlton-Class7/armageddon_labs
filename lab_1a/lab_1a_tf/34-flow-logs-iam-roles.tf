# IAM Role - VPC Flow Log
resource "aws_iam_role" "vpc_flow_log_role" {
  name               = "vpc-flow-log-role-${local.name_suffix}"
  assume_role_policy = data.aws_iam_policy_document.private_data_subnet_flow_log_assume_role.json
}

# Trust Policy Data for VPC Flow Log role
data "aws_iam_policy_document" "vpc_flow_log_assume_role" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["vpc-flow-logs.amazonaws.com"]
    }
  }
}

# Policy Attachment - VPC Flow Log Assume Role --> Private Data Subnet Flow Log role
# Consider more informative and scaleable way to name role policy attachment resources (Think about naming methods for roles with multiple policies. How to scope?)
resource "aws_iam_role_policy_attachment" "attach_vpc_flow_log_assume_role" {
  role       = aws_iam_role.vpc_flow_log_role.name # Remember, role attachment takes a role name and policy ARN
  policy_arn = aws_iam_policy.vpc_flow_log_role.arn
}








# IAM Role - Private Data Subnet Flow Log
resource "aws_iam_role" "private_data_subnet_flow_log_role" {
  name               = "private-data-subnet-flow-log-role-${local.name_suffix}"
  assume_role_policy = data.aws_iam_policy_document.private_data_subnet_flow_log_assume_role.json
}

# Trust Policy Data for Private Data Subnet Flow Log role
data "aws_iam_policy_document" "private_data_subnet_flow_log_assume_role" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["vpc-flow-logs.amazonaws.com"]
    }
  }
}

# Policy Attachment - Private Data Subnet Flow Log Assume Role --> Private Data Subnet Flow Log role
resource "aws_iam_role_policy_attachment" "attach_private_data_subnet_flow_log_assume_role" {
  role       = aws_iam_role.private_data_subnet_flow_log_role.name
  policy_arn = aws_iam_policy.private_data_subnet_flow_log_role.arn
}