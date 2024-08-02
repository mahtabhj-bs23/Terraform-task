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

  load_balancer {
    target_group_arn = var.ts_auth_tg
    container_name   = "task-station-auth"
    container_port   = 8000
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

  load_balancer {
    target_group_arn = var.ts_platform_tg
    container_name   = "task-station-platform"
    container_port   = 8000
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

  load_balancer {
    target_group_arn = var.ts_integration_tg
    container_name   = "task-station-integration"
    container_port   = 8000
  }
}

resource "aws_ecs_service" "ts-integration-celery" {
  name            = "task-station-${var.tag}-integration-celery"
  cluster         = aws_ecs_cluster.task-station-ecs-cluster.name
  task_definition = aws_ecs_task_definition.task_station_integration_celery_task_defination.arn
  launch_type     = "FARGATE"
  desired_count   = "1"
  network_configuration {
    subnets          = [var.public_subnets[0], var.public_subnets[1], var.public_subnets[2]]
    security_groups  = [aws_security_group.ecs-fargate.id]
    assign_public_ip = false
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

  load_balancer {
    target_group_arn = var.ts_report_tg
    container_name   = "task-station-report"
    container_port   = 8000
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

resource "aws_cloudwatch_log_group" "task-station-integration-celery-log-group" {
  name              = "/ecs/task-station-integration-celery"
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