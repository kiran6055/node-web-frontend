resource "aws_iam_role" "app_role_task_execution" {
  name = "${local.tags.name}-ecs_task_execution"
  assume_role_policy = data.aws_iam_policy_document.ecs_trust.json
  tags = local.tags

}


#this is mandatory to pull the image form ECR
resource "aws_iam_role_policy_attachment" "ecr_pull" {
  role       = aws_iam_role.app_role_task_execution.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}


resource "aws_iam_role" "app_role_task" {

  name = "${local.tags.name}-task"
  assume_role_policy = data.aws_iam_policy_document.ecs_trust.json
  tags = local.tags


}

