provider "aws" {
  region = "ap-south-1"
}

resource "aws_amplify_app" "react_app" {
  name        = "react-app"
  repository  = var.git_config.repo_url
  iam_service_role_arn = "arn:aws:iam::${var.account}:role/service-role/AmplifySSRLoggingRole-d258srhc32j5pl"
  build_spec  = <<-EOT
    version: 1
    frontend:
        phases:
            preBuild:
                commands:
                    - npm ci
            build:
                commands:
                    - npm run build
        artifacts:
            baseDirectory: .next
            files:
                - '**/*'
        cache:
            paths:
                - node_modules/**/*
    EOT
  access_token = var.git_config.git_access_token
  custom_rule {
    source = "/<*>"
    status = "404-200"
    target = "/index.html"
  }

}

resource "aws_amplify_branch" "react_branch" {
  app_id       = aws_amplify_app.react_app.id
  branch_name  = "main"
  framework = "react"
}
