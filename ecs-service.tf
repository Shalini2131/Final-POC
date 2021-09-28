resource "aws_ecs_service" "service" {
  cluster                = aws_ecs_cluster.cluster.id
  desired_count          = 1
  launch_type            = "EC2"
  name                   = "terraform-service"
  task_definition        = aws_ecs_task_definition.task_definition.arn
  scheduling_strategy    = "REPLICA"
#   iam_role = "arn:aws:iam::576467192933:role/CodeDeployForECSRole"
#   deployment_controller {
# type = "CODE_DEPLOY"
# }
  load_balancer {
    container_name       = "terraform-ecs-yellow-container"
    container_port       = "80"
    target_group_arn     = aws_lb_target_group.lb_target_group_yellow.arn
  }
  load_balancer {
    container_name       = "terraform-ecs-red-container"
    container_port       = "80"
    target_group_arn     = aws_lb_target_group.lb_target_group_red.arn
  }
  load_balancer {
    container_name       = "terraform-ecs-blue-container"
    container_port       = "80"
    target_group_arn     = aws_lb_target_group.lb_target_group_blue.arn
  }
}

