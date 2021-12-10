variable "env" {}
variable "name" {}
variable "owner" {}

# iam
variable "trusted_role_services" {}
variable "custom_role_policy_arns" {}

# codepipeline
variable "codebuild_key" {}
variable "codedeploy_app_key" {}
variable "codedeploy_deployment_group_key" {}