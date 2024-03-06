output "vpc_id" {
  value = module.vpc.vpc_id
}
output "database_subnet_group_name" {
  value = module.vpc.database_subnet_group_name
}
output "database_subnets" {
  value = module.vpc.database_subnets
}
output "public_subnets" {
  value = module.vpc.public_subnets
}
output "private_subnets" {
  value = module.vpc.private_subnets
}
output "postgres_db_sg_id" {
  value = aws_security_group.postgres_db_sg.id
}