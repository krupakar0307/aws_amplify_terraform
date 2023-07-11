1. installed terraform and awscli on local
2. cloned Next.js sample application code on local
3. runned sample application on local.
4. pushed sample application code on my github
5. written main.tf file. In which i have use provider module, amplify module and amplify branch module.
6. added amplify.yml code in main.tf
7. passed secret like git_access_token and iam_role through variable.tf
8. runned terraform init for initilise terraform libraries.
9. then runned terraform plan and terraform apply
10. after succesfully provisioned amplify app on amplify dashboard i have triggered CI/CD pipeline.
11. after successfull deployment we can access app with the amplify domain.

domain_name:  https://main.d3nebhjunz2hst.amplifyapp.com

git_repository: https://github.com/narotam-1813/react-app-amplify.git