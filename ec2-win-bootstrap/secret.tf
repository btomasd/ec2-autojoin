# Create Secret Manager IAM Policy
resource "aws_iam_policy" "secret_manager_ec2_policy" {
  name        = "secret-manager-ec2-policy"
  description = "Secret Manager EC2 policy"  
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "secretsmanager:*"
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}# Attach Secret Manager Policies to Instance Role
resource "aws_iam_policy_attachment" "api_secret_manager_ec2_attach" {
  name       = "secret-manager-ec2-attachment"
  roles      = [aws_iam_role.ec2_iam_role.id]
  policy_arn = aws_iam_policy.secret_manager_ec2_policy.arn
}