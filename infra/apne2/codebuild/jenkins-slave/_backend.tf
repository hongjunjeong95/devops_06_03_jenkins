terraform {
  backend "s3" {
    bucket      = "devops-dev-tfbackend-s3-lewisjeong"
    key         = "dev/apne2/codebuild/jenkins-slave/terraform.tfstate"
    region      = "ap-northeast-2"
#    role_arn    = "{ASSUMED_ROLE}"
    max_retries = 3
  }
}
