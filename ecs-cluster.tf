resource "aws_ecs_cluster" "cluster" {
  name = "terraform-ecs-cluster"
  tags = {
    name = "terraform-ecs-cluster"
  }
}