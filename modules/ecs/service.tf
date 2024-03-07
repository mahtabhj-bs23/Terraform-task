resource "aws_ecs_service" "ts-auth-service" {
  name            = "task-station-${var.tag}-auth"
  cluster         = aws_ecs_cluster.task-station-ecs-cluster.name
  task_definition = aws_ecs_task_definition.task_station_auth_task_defination.arn
  launch_type     = "FARGATE"
  desired_count   = "1"
  network_configuration {
    subnets          = [var.public_subnets[0], var.public_subnets[1], var.public_subnets[2]]
    security_groups  = [aws_security_group.ecs-fargate.id]
    assign_public_ip = true
  }
}

resource "aws_ecs_service" "ts-platform-service" {
  name            = "task-station-${var.tag}-platform"
  cluster         = aws_ecs_cluster.task-station-ecs-cluster.name
  task_definition = aws_ecs_task_definition.task_station_platform_task_defination.arn
  launch_type     = "FARGATE"
  desired_count   = "1"
  network_configuration {
    subnets          = [var.public_subnets[0], var.public_subnets[1], var.public_subnets[2]]
    security_groups  = [aws_security_group.ecs-fargate.id]
    assign_public_ip = true
  }
}

resource "aws_ecs_service" "ts-integration-service" {
  name            = "task-station-${var.tag}-integration"
  cluster         = aws_ecs_cluster.task-station-ecs-cluster.name
  task_definition = aws_ecs_task_definition.task_station_integration_task_defination.arn
  launch_type     = "FARGATE"
  desired_count   = "1"
  network_configuration {
    subnets          = [var.public_subnets[0], var.public_subnets[1], var.public_subnets[2]]
    security_groups  = [aws_security_group.ecs-fargate.id]
    assign_public_ip = true
  }
}

resource "aws_ecs_service" "ts-report-service" {
  name            = "task-station-${var.tag}-report"
  cluster         = aws_ecs_cluster.task-station-ecs-cluster.name
  task_definition = aws_ecs_task_definition.task_station_report_task_defination.arn
  launch_type     = "FARGATE"
  desired_count   = "1"
  network_configuration {
    subnets          = [var.public_subnets[0], var.public_subnets[1], var.public_subnets[2]]
    security_groups  = [aws_security_group.ecs-fargate.id]
    assign_public_ip = true
  }
}

resource "aws_cloudwatch_log_group" "task-station-auth-log-group" {
  name              = "/ecs/task-station-auth"
  retention_in_days = "3"
}

resource "aws_cloudwatch_log_group" "task-station-integration-log-group" {
  name              = "/ecs/task-station-integration"
  retention_in_days = "3"
}

resource "aws_cloudwatch_log_group" "task-station-platform-log-group" {
  name              = "/ecs/task-station-platform"
  retention_in_days = "7"
}

resource "aws_cloudwatch_log_group" "task-station-report-log-group" {
  name              = "/ecs/task-station-report"
  retention_in_days = "7"
}