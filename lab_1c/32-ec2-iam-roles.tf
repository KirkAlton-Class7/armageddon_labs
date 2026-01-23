# IAM Role - Read DB Secret
resource "aws_iam_role" "read_db_secret" {
  name               = "read-db-secret-role-${local.name_suffix}"
  assume_role_policy = data.aws_iam_policy_document.read_db_secret_assume_role.json
  description        = "EC2 role that reads a db secret."

  tags = {
    Name        = "read-db-secret-role"
    Component   = "iam"
    DataClass   = "confidential"
    AccessLevel = "read-only"
  }
}

# Trust Policy Data for Read DB Secret role
data "aws_iam_policy_document" "read_db_secret_assume_role" {
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

# Policy Attachment - Read DB Secret --> Read DB Secret role
resource "aws_iam_role_policy_attachment" "attach_read_db_secret" {
  role       = aws_iam_role.read_db_secret.name
  policy_arn = aws_iam_policy.read_db_secret.arn
}

# Policy Attachment - Read DB Name Parameter --> Read DB Secret role
resource "aws_iam_role_policy_attachment" "attach_read_db_name_parameter" {
  role       = aws_iam_role.read_db_secret.name
  policy_arn = aws_iam_policy.read_db_name_parameter.arn
}

# Policy Attachment - Read DB Username Parameter --> Read DB Secret role
resource "aws_iam_role_policy_attachment" "attach_read_db_username_parameter" {
  role       = aws_iam_role.read_db_secret.name
  policy_arn = aws_iam_policy.read_db_username_parameter.arn
}

# Policy Attachment - Read DB Host Parameter --> Read DB Secret role
resource "aws_iam_role_policy_attachment" "attach_read_db_host_parameter" {
  role       = aws_iam_role.read_db_secret.name
  policy_arn = aws_iam_policy.read_db_host_parameter.arn
}

# Policy Attachment - Read DB Port Parameter --> Read DB Secret role
resource "aws_iam_role_policy_attachment" "attach_read_db_port_parameter" {
  role       = aws_iam_role.read_db_secret.name
  policy_arn = aws_iam_policy.read_db_port_parameter.arn
}