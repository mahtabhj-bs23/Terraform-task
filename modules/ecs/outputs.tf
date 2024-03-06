output "ecs_cluster_name" {
  value = aws_ecs_cluster.task-station-ecs-cluster.name
}
output "ecs_service_sg_id" {
  value = aws_security_group.ecs-fargate.id
}