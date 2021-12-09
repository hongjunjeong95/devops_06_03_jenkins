resource "aws_codedeploy_deployment_group" "this" {
  app_name              = aws_codedeploy_app.this.name
  deployment_group_name = local.deployment_group_name
  service_role_arn      = module.iam.iam_role_arn
  # 여러 개의 target server에 배포할 때 deployment_config_name 주석 해제
  deployment_config_name = aws_codedeploy_deployment_config.this.id

  ec2_tag_set {
    dynamic "ec2_tag_filter" {
      for_each = local.ec2_tag_filter
      content {
        key = lookup(ec2_tag_filter.value, "key")
        type = lookup(ec2_tag_filter.value, "type")
        value = lookup(ec2_tag_filter.value, "value")
      }
    }
  }

#  trigger_configuration {
#    trigger_events     = ["DeploymentFailure"]
#    trigger_name       = "example-trigger"
#    trigger_target_arn = aws_sns_topic.example.arn
#  }

  # rollback 설정
  # 배포 실패시 롤백 실행
  auto_rollback_configuration {
    enabled = true
    events  = ["DEPLOYMENT_FAILURE"]
  }

#  alarm_configuration {
#    alarms  = ["my-alarm-name"]
#    enabled = true
#  }

  tags = merge(local.tags, { Name = local.deployment_group_name })
}
