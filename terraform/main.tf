provider "aws" {
  region = "ap-south-1"
}

resource "aws_amplify_app" "react_app" {
  name        = var.app_name
  repository  = var.git_url
  iam_service_role_arn = aws_iam_role.amplify_role.arn
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
  access_token = var.git_access_token
  platform = "WEB_COMPUTE"
  custom_rule {
    source = "/<*>"
    status = "404-200"
    target = "/index.html"
  }

}

resource "aws_amplify_branch" "react_branch" {
  app_id       = aws_amplify_app.react_app.id
  branch_name  = var.git_branch
  framework = "Next.js - SSR"
}
