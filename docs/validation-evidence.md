# AWS CodeDeploy Validation Evidence

## Environment

- AWS account: `774305591665`
- IAM user: `3rd-lab-user`
- AWS region: `us-east-1`
- Terraform version: `1.17.0`
- Project: `terraform-aws-codedeploy-lab`

## AWS Discovery

Command:

```bash
aws deploy list-applications --region us-east-1
```

Observed result:

```json
{
  "applications": []
}
```

Application count: `0`.

## Terraform Validation

Command:

```bash
terraform validate
```

Observed output:

```text
Success! The configuration is valid.
```

## Terraform Plan

Command:

```bash
terraform plan -input=false -no-color
```

Observed result:

```text
Plan: 4 to add, 0 to change, 0 to destroy.
```

Planned resources:

1. `aws_codedeploy_app.lab`
2. `aws_iam_role.codedeploy`
3. `aws_iam_role_policy_attachment.codedeploy`
4. `aws_codedeploy_deployment_group.lab`

## Deployment Status

**PLAN ONLY — NOT DEPLOYED.**

No `terraform apply` was executed.

No AWS resources were created or modified by this lab.

No application deployments were tested.

## Screenshot

`screenshots/codedeploy-terraform-validation.png` — actual terminal evidence of successful Terraform validation and planning.

