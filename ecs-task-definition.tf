resource "aws_ecs_task_definition" "task_definition" {
  container_definitions    = data.template_file.task_definition_json.rendered
  family                   = "terraform-ecs-task-definition"
  requires_compatibilities = ["EC2"]
  network_mode = "bridge"
}

data "template_file" "task_definition_json" {
  template = "${file("${path.module}/task_definition.json")}"
}