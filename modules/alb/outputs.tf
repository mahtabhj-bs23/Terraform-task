output "alb_sg_id" {
  value = module.alb.security_group_id
}
output "target_group_arn" {
  value = aws_alb_target_group.piczangu-target-group.arn
}
output "alb_dns_name" {
  value = module.alb.dns_name
}
output "alb_zone_id" {
  value = module.alb.zone_id
}