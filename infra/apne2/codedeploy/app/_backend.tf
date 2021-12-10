terraform {
  backend "s3" {
    buckebucket = "devops-dev-tfbackend-s3-lewisjeong"
    key         = "dev/apne2/codedeploy/app/terraform.tfstate"
    region      = "ap-northeast-2"
#    role_arn    = "{ASSUMED_ROLE}"
    max_retries = 3
  }
}
