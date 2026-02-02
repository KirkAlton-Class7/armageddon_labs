# Instance Profiles

# Instance Profile - RDS App
resource "aws_iam_instance_profile" "rds_app" {
  name = "rds-app-instance-profile"
  role = aws_iam_role.rds_app.name
}


# EC2 Instances

# # EC2 - RDS App EC2
# resource "aws_instance" "rds_app" {
#   ami                    = data.aws_ami.amazon_linux_2023.id
#   instance_type          = "t3.micro"
#   subnet_id              = local.random_private_app_subnet
#   vpc_security_group_ids = [local.ec2_sg_id]

#   iam_instance_profile = aws_iam_instance_profile.rds_app.name
#   # key_name             = aws_key_pair.tf_armageddon_key.key_name
#   # Replace with your key aws_key_pair resource to test EC2 via SSH

#   user_data = local.rds_app_user_data

#   associate_public_ip_address = false


#   # EC2 depends on VPC Endpoints for access to S3, SSM and CloudWatch Logs (boot script also uses these services)
#   depends_on = [
#     aws_vpc_endpoint.s3,
#     aws_vpc_endpoint.secretsmanager,
#     aws_vpc_endpoint.ssm,
#     aws_vpc_endpoint.ssm_messages,
#     aws_vpc_endpoint.ec2_messages,
#     aws_vpc_endpoint.ec2,
#     aws_vpc_endpoint.logs
#   ]

#   tags = {
#     Name        = "rds-app-ec2"
#     App         = "${local.application}"
#     Environment = "${local.environment}"
#     Service     = "post-notes"
#     Component   = "compute-ec2"
#     Scope       = "frontend"
#   }
# }