# IAM Role - Get-DB-Secret
resource "aws_iam_role" "get_db_secret" {
  name               = "get-db-secret-${local.name_suffix}"
  assume_role_policy = data.aws_iam_policy_document.get_db_secret.json
  description = "EC2 role that retrieves db secret."

 tags = {
    Name = "get-db-secret"
    Component = "iam"
    DataClass = "confidential"
    AccessLevel = "read-only"
  }
}

# Trust Policy Data - Get-DB-Secret
data "aws_iam_policy_document" "get_db_secret" {
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

# Policy Attachment - Read-DB-Secret --> Get-DB-Secret
resource "aws_iam_role_policy_attachment" "attach_read_db_secret" {
  role       = aws_iam_role.get_db_secret.name
  policy_arn = aws_iam_policy.read_db_secret.arn
}