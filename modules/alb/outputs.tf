output "alb_sg_id" {
  value = module.alb.security_group_id
}
output "ts_auth_target_group_arn" {
  value = aws_alb_target_group.task-station-v2-auth-target-group[0].arn
}
output "ts_platform_target_group_arn" {
  value = aws_alb_target_group.task-station-v2-platform-target-group.arn
}
output "ts_integration_target_group_arn" {
  value = aws_alb_target_group.task-station-v2-integration-target-group.arn
}
output "ts_report_target_group_arn" {
  value = aws_alb_target_group.task-station-v2-report-target-group.arn
}
output "alb_dns_name" {
  value = module.alb.dns_name
}
output "alb_zone_id" {
  value = module.alb.zone_id
}