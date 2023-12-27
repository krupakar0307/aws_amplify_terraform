variable "app_name" {
  type = string
  description = "Provide Name for your App"
}

variable "git_url" {
  type = string
  description = "Provide repo_Url for deploy"  
}
variable "git_access_token" {
  type = string
  description = "Provide Git_Token for authorize by Amplify"
}
variable "git_branch" {
  type = string
  description = "Provide Branch Name for your code."
}
