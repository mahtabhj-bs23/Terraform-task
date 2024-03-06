resource "aws_ecs_cluster" "task-station-ecs-cluster" {
  name = "task-station-${var.tag}-cluster"

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}

resource "aws_ecs_cluster_capacity_providers" "task-station-ecs-capacity" {
  cluster_name = aws_ecs_cluster.task-station-ecs-cluster.name

  capacity_providers = ["FARGATE"]

  default_capacity_provider_strategy {
    base              = 1
    weight            = 100
    capacity_provider = "FARGATE"
  }
}