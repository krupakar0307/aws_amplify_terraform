variable "account" {
  type = string
}
variable "git_config" {
  type = object({
    git_access_token = string
    repo_url = string
  })
}  