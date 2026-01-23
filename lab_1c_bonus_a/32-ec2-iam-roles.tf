# IAM Role - Internal App Role
resource "aws_iam_role" "internal_app" {
  name               = "internal-app-role-${local.name_suffix}"
  assume_role_policy = data.aws_iam_policy_document.internal_app_assume_role.json
  description        = "EC2 role that reads a db secret."

  tags = {
    Name        = "internal-app-role"
    Component   = "iam"
    DataClass   = "confidential"
    AccessLevel = "read-only"
  }
}

# Trust Policy Data for Internal App role
data "aws_iam_policy_document" "internal_app_assume_role" {
  statement {
    effect = "Allow"
    actions = [
      "sts:AssumeRole"
    ]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}


# Policy Attachment - SSM Agent Policy --> Internal App role
resource "aws_iam_role_policy_attachment" "attach_ssm_agent_policy" {
  role       = aws_iam_role.internal_app.name
  policy_arn = aws_iam_policy.ssm_agent_policy.arn
}

# Policy Attachment - Read DB Secret --> Internal App role
resource "aws_iam_role_policy_attachment" "attach_read_db_secret" {
  role       = aws_iam_role.internal_app.name
  policy_arn = aws_iam_policy.read_db_secret.arn
}

# Policy Attachment - Read DB Name Parameter --> Internal App role
resource "aws_iam_role_policy_attachment" "attach_read_db_name_parameter" {
  role       = aws_iam_role.internal_app.name
  policy_arn = aws_iam_policy.read_db_name_parameter.arn
}

# Policy Attachment - Read DB Username Parameter --> Internal App role
resource "aws_iam_role_policy_attachment" "attach_read_db_username_parameter" {
  role       = aws_iam_role.internal_app.name
  policy_arn = aws_iam_policy.read_db_username_parameter.arn
}

# Policy Attachment - Read DB Host Parameter --> Internal App role
resource "aws_iam_role_policy_attachment" "attach_read_db_host_parameter" {
  role       = aws_iam_role.internal_app.name
  policy_arn = aws_iam_policy.read_db_host_parameter.arn
}

# Policy Attachment - Read DB Port Parameter --> Internal App role
resource "aws_iam_role_policy_attachment" "attach_read_db_port_parameter" {
  role       = aws_iam_role.internal_app.name
  policy_arn = aws_iam_policy.read_db_port_parameter.arn
}