data "aws_iam_policy" "ampliy_policy" {
    arn = "arn:aws:iam::aws:policy/service-role/AmplifyBackendDeployFullAccess"
}
resource "aws_iam_role" "amplify_role" {
  name = "app-amplify-role"
  
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = "sts:AssumeRole",
      Effect = "Allow",
      Principal = {
        Service = "amplify.amazonaws.com"
      }
    }]
  })
}
resource "aws_iam_role_policy_attachment" "amplify_attach" {
  policy_arn = data.aws_iam_policy.ampliy_policy.arn
  role       = aws_iam_role.amplify_role.name
}
