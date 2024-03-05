data "aws_iam_policy_document" "ecs_trust" {

    statement {
      sid = "ECSAssumeRole"
      actions = ["sts:AssumeRole"]
    principals {
        type        = "Service"
        identifiers = ["ecs-tasks.amazonaws.com"]
      }

    }

}


data "aws_ssm_parameter" "app_alb_security_group_id" {
  name = "/timing/vpc/app_alb_security_group_id"
}

data "aws_ssm_parameter" "web_alb_security_group_id" {
  name = "/timing/vpc/web_alb_security_group_id"
}

data "aws_ssm_parameter" "vpc_id" {
  name = "/timing/vpc/vpc_id"
}


data "aws_ssm_parameter" "ecs_cluster_id" {
  name = "/timing/ecs/ecs_cluster_id"
}

data "aws_ssm_parameter" "private_subent_ids" {
  name = "/timing/vpc/private_subent_ids"
}

data "aws_ssm_parameter" "app_target_group_arn" {
  name = "/timing/vpc/app_target_group_arn"
}

data "aws_ssm_parameter" "web_target_group_arn" {
  name = "/timing/vpc/web_target_group_arn"
}


data "aws_ssm_parameter" "private_subnet_ids" {
  name = "/timing/vpc/private_subnet_ids"
}

