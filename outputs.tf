
output "codedeploy_application_name" {
  description = "Name of the planned CodeDeploy application."
  value       = aws_codedeploy_app.lab.name
}

output "codedeploy_deployment_group_name" {
  description = "Name of the planned deployment group."
  value       = aws_codedeploy_deployment_group.lab.deployment_group_name
}

output "codedeploy_role_arn" {
  description = "ARN of the planned CodeDeploy IAM role."
  value       = aws_iam_role.codedeploy.arn
}
