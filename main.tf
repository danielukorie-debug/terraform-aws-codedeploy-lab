
# CodeDeploy application
resource "aws_codedeploy_app" "lab" {
  name             = "terraform-codedeploy-lab"
  compute_platform = "Server"
}

# IAM role trusted by CodeDeploy
resource "aws_iam_role" "codedeploy" {
  name = "terraform-codedeploy-lab-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "codedeploy.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })

  tags = {
    Project     = "terraform-aws-codedeploy-lab"
    Environment = "learning"
    ManagedBy   = "Terraform"
  }
}

# AWS-managed CodeDeploy service role policy
resource "aws_iam_role_policy_attachment" "codedeploy" {
  role       = aws_iam_role.codedeploy.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSCodeDeployRole"
}

# CodeDeploy deployment group
resource "aws_codedeploy_deployment_group" "lab" {
  app_name              = aws_codedeploy_app.lab.name
  deployment_group_name = "terraform-codedeploy-lab-group"
  service_role_arn      = aws_iam_role.codedeploy.arn

  deployment_config_name = "CodeDeployDefault.OneAtATime"

  ec2_tag_filter {
    key   = "CodeDeploy"
    type  = "KEY_AND_VALUE"
    value = "terraform-codedeploy-lab"
  }

  depends_on = [
    aws_iam_role_policy_attachment.codedeploy
  ]
}
