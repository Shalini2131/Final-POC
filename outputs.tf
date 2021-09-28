output "ecs_cluster" {
  value = aws_ecs_cluster.cluster
}

output "aws_instance" {
  value = aws_instance.ec2_instance
}

output "aws_launch_configuration" {
  value = aws_launch_configuration.as_conf
}

output "ecs_task_definition" {
  value = aws_ecs_task_definition.task_definition
}

output "aws_lb" {
  value = aws_lb.load_balancer
}

output "ecs_service" {
  value = aws_ecs_service.service
}